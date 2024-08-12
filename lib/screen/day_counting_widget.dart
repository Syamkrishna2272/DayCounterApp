import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayCounter extends StatefulWidget {
  const DayCounter(
      {super.key,
      required this.data,
      required this.startDate,
      required this.endDate});
  final dynamic data;
  final DateTime startDate, endDate;

  @override
  State<DayCounter> createState() => _DayCounterState();
}

class _DayCounterState extends State<DayCounter> {
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
    final days = remainingTime.inDays;
    final hours = remainingTime.inHours.remainder(24);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.yellow,
          child: (days > 0 || hours > 0)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (days > 0)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            color: Colors.green,
                            child: Center(
                              child: Text('$days'),
                            ),
                          ),
                          const Text("Days"),
                        ],
                      ),
                    if (hours > 0)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.pink,
                            height: 25,
                            width: 25,
                            child: Center(
                              child: Text('$hours'),
                            ),
                          ),
                          const Text("Hours"),
                        ],
                      ),
                  ],
                )
              : Container(
                  color: Colors.blue,
                ),
        ),
      ),
    );
  }
}