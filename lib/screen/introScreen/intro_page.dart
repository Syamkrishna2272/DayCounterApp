import 'package:day_counter/screen/loginScreen/login.dart';
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
            SizedBox(height: MediaQuery.sizeOf(context).height / 8),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.2,
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
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserLoginPage()),
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
