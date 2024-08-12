
import 'package:day_counter/screen/homeScreen/popup.dart';
import 'package:day_counter/screen/listviewHome_Screen/streambuilder.dart';
import 'package:flutter/material.dart';

class GoalCounterScreen extends StatelessWidget {
  const GoalCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          leading: const Icon( 
            Icons.account_box_rounded,
            color: Colors.white,
          ),
          title: const Center(
            child: Text(
              "Goal Counter",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          actions: const [
            PopUp1(),
          ],
        ),
        body: const SafeArea(
            child: StreamWidget()));
  }
}




