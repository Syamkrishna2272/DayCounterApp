
import 'package:day_counter/widget/streambuilder.dart';
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
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) {
                switch (value) {
                  case 1:
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Send Feedback"),
                ),
              ],
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: const SafeArea(
            child: StreamWidget()));
  }
}


