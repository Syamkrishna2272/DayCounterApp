import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(121212),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Make every day count",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const Text(
                    "Tracking your progress towards your goals. Each day brings you closer to achieving your milestones.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 25),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF2C69DE),
                        borderRadius: BorderRadius.circular(5)),
                    height: MediaQuery.sizeOf(context).height / 17,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Center(
                        child: Text(
                      "Get Start",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
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
