import 'package:day_counter/function/date_time_adding.dart';
import 'package:day_counter/function/date_time_editing.dart';
import 'package:day_counter/screen/addDialogscreen/goal_add_screen.dart';
import 'package:flutter/material.dart';

class CountdownButton extends StatelessWidget {
  const CountdownButton({
    super.key,
    required this.widget,
    required this.tittlecontroller,
    required this.daycontroller,
  });

  final GoalAdding widget;
  final TextEditingController tittlecontroller;
  final TextEditingController daycontroller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width / 45),
        ),
        child: Center(
          child: Text(
            (widget.isEditPage == true) ? 'Edit' : 'Start CountDown',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}