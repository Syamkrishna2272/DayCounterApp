import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DayTimeShowing extends StatefulWidget {
  const DayTimeShowing(
      {super.key,
      required this.data,
      required this.startDate,
      required this.endDate});
  final dynamic data;
  final DateTime startDate, endDate;

  @override
  State<DayTimeShowing> createState() => _DayTimeShowingState();
}

class _DayTimeShowingState extends State<DayTimeShowing> {
  late Timer timer;
  Duration remainingTime = Duration.zero;

  void checkTime() {
    remainingTime = widget.endDate.difference(DateTime.now());
    timer = Timer.periodic(const Duration(hours: 1), (timer) {
      remainingTime = widget.endDate.difference(DateTime.now());
      if (remainingTime.isNegative) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    checkTime();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final days = widget.endDate.difference(now).inDays;
    final hours = widget.endDate.difference(now).inHours.remainder(24);

    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('goalcollection').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: (days > 0 || hours > 0)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (days > 0)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 118, 117, 117),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width / 60)),
                                height: MediaQuery.sizeOf(context).width / 9,
                                width: MediaQuery.sizeOf(context).width / 9,
                                child: Center(
                                  child: Text(
                                    '$days',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.sizeOf(context).width /
                                                15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Text("Days",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).width / 35,
                                      color: const Color(0xFF2C69DE),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        if (hours > 0)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 118, 117, 117),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).width / 60)),
                                height: MediaQuery.sizeOf(context).width / 9,
                                width: MediaQuery.sizeOf(context).width / 9,
                                child: Center(
                                  child: Text(
                                    '$hours',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.sizeOf(context).width /
                                                15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Text("Hours",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).width / 35,
                                      color: const Color(0xFF2C69DE),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF2C69DE),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.sizeOf(context).width / 25)),
                      child: const Center(
                        child: Text(
                          "COMPLETED",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
