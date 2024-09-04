import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/addDialogscreen/widget/countdownbutton.dart';
import 'package:day_counter/screen/addDialogscreen/widget/dayadding_widget.dart';
import 'package:day_counter/screen/addDialogscreen/widget/titleadding_widget.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Color.fromARGB(255, 29, 29, 35),
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
              child: Text(
                'Create Your Countdown Timer. Start tracking your ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width / 30,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
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
            TitleAdding(tittlecontroller: tittlecontroller), //Title Adding
            SizedBox(height: MediaQuery.sizeOf(context).width / 30),
            const Text(
              "Number of Days*",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            DayAdding(daycontroller: daycontroller), //DayAdding
            SizedBox(height: MediaQuery.sizeOf(context).height / 30),
            CountdownButton(
                widget: widget,
                tittlecontroller: tittlecontroller,
                daycontroller: daycontroller)
          ],
        ),
      ),
    );
  }
}
