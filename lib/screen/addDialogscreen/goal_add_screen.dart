import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/function/date_time_adding.dart';
import 'package:day_counter/function/date_time_editing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoalAdding extends StatefulWidget {
  const GoalAdding({super.key, this.isEditPage, this.goaldata});
  final bool? isEditPage;
  final dynamic goaldata;
  @override
  State<GoalAdding> createState() => _GoalAddingState();
}

class _GoalAddingState extends State<GoalAdding> {
  TextEditingController tittlecontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();

  @override
  void initState() {
    if (widget.isEditPage == true) {
      tittlecontroller.text = widget.goaldata['Tittle'].toString();
      Timestamp start = widget.goaldata['StartDate'];
      Timestamp end = widget.goaldata['EndDate'];
      DateTime startDate = start.toDate();
      DateTime endDate = end.toDate();
      int dayDifference = endDate.difference(startDate).inDays;
      daycontroller.text = '$dayDifference';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width / 17,
          right: MediaQuery.sizeOf(context).width / 17),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.sizeOf(context).width / 35),
      ),
      backgroundColor: const Color(0xFF34343E),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 4.5,
                ),
                SizedBox(
                  child: Center(
                    child: Text(
                      "Create your Goal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.sizeOf(context).width / 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    height: MediaQuery.sizeOf(context).width / 8,
                    width: MediaQuery.sizeOf(context).width / 8,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: MediaQuery.sizeOf(context).width / 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              // alignment: Alignment.center,
              child: Text(
                'Create Your Countdown Timer. Start tracking your ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width / 28,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              // alignment: Alignment.center,
              child: Text(
                'journey to success today! ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width / 28,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 25),
            const Text(
              "Title*",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 15,
              child: TextField(
                controller: tittlecontroller,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Enter title (Mandatory)",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 114, 113, 113)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width / 45),
                  ),
                  fillColor: const Color(0xFF121212),
                  filled: true,
                ),
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height / 63,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                cursorColor: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width / 30),
            const Text(
              "Number of Days*",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 16,
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: TextField(
                    controller: daycontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Days (Mandatory)",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 114, 113, 113)),
                      // hintStyle: const TextStyle(color: Color(0xFFEDEDED)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).width / 45),
                      ),
                      fillColor: const Color(0xFF121212),
                      filled: true,
                    ),
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 63,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 16,
                  width: MediaQuery.sizeOf(context).width / 2.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width / 45),
                  ),
                  child: Center(
                    child: Text(
                      "DAYS",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width / 18,
                          color: const Color(0xFFB0B0B0),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 30),
            InkWell(
              onTap: () {
                (widget.isEditPage == true)
                    ? editcount(
                        tittlecontroller: tittlecontroller,
                        daycontroller: daycontroller,
                        context: context,
                        doc: widget.goaldata)
                    : startcount(
                        tittlecontroller: tittlecontroller,
                        daycontroller: daycontroller,
                        context: context);
              },
              child: Ink(
                height: MediaQuery.sizeOf(context).height / 17,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C69DE),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width / 45),
                ),
                child: Center(
                  child: Text(
                    (widget.isEditPage == true) ? 'Edit' : 'Start CountDown',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
