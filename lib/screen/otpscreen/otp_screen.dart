import 'package:day_counter/screen/homeScreen/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width / 20,
            right: MediaQuery.sizeOf(context).width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text("OTP Verification",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))),
            Center(
                child: Text("We have sent an OTP to your email address",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width / 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white))),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 35,
            ),
            Text('OTP',
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height / 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.1,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    suffixText: "Resend OTP",
                    suffixStyle: const TextStyle(color: Color(0xFF2653AE)),
                    hintText: 'Enter OTP here',
                    hintStyle: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width / 28,
                        color: const Color.fromARGB(255, 114, 113, 113)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.sizeOf(context).width / 45))),
                style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).height / 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 35,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GoalCounterScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Ink(
                height: MediaQuery.sizeOf(context).height / 17,
                width: MediaQuery.sizeOf(context).width / 1.1,
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
                  "Continue",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 45,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
