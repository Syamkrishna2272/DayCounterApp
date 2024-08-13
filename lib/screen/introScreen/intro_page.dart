import 'package:day_counter/screen/homeScreen/goal_screen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height / 12),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.9,
              width: MediaQuery.sizeOf(context).height / 3,
              child: Image.asset('asset/img/Group 158.png'),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 12),
            Padding(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make every day count",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "Tracking your progress towards your goals. Each day brings you closer to achieving your milestones.",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 55,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GoalCounterScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF2C69DE),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.sizeOf(context).width / 35)),
                      height: MediaQuery.sizeOf(context).height / 17,
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                          child: Text(
                        "Get Start",
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height / 45,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
