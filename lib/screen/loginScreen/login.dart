import 'package:day_counter/screen/otpscreen/otp_screen.dart';
import 'package:day_counter/screen/signupScreen/signup_page.dart';
import 'package:flutter/material.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width / 20,
              right: MediaQuery.sizeOf(context).width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("Login/Register",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height / 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 35,
              ),
              Text('User Name',
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.1,
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      hintText: 'Enter user name',
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
              Text('Email',
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.1,
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      hintText: 'Enter email',
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
              SizedBox(height: MediaQuery.sizeOf(context).height / 25),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OtpVerificationPage();
                  }));
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
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Don't have a account?",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height / 50,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const UserSignupPage();
                        }));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height / 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
