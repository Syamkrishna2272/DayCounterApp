import 'package:day_counter/screen/homeScreen/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class LoginsuccessAnimation extends StatelessWidget {
  const LoginsuccessAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset(
              'asset/animation/Animation - 1725968504012 (1).json',
              width: MediaQuery.sizeOf(context).width / 2,
              height: MediaQuery.sizeOf(context).height / 5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 25),
            Text(
              'All Set',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width / 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 35),
             Text(
              'You have successfully created your account.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: MediaQuery.sizeOf(context).width/30,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width / 22,
                  right: MediaQuery.sizeOf(context).width / 22,
                  bottom: MediaQuery.sizeOf(context).height / 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const GoalCounterScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Ink(
                  height: MediaQuery.sizeOf(context).height / 17,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2C69DE),
                        Color(0xFF2653AE),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width / 40),
                  ),
                  child: Center(
                      child: Text(
                    "Let's Continue",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 45,
                        color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
