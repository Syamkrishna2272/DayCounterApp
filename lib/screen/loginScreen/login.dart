import 'package:day_counter/screen/homeScreen/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            children: [
              Center(
                  child: Text("Welcome to Goal Counter",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height / 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 25,
              ),
              Text("Create your own Space",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              SizedBox(height: MediaQuery.sizeOf(context).height / 25),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GoalCounterScreen();
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: MediaQuery.sizeOf(context).height / 35,
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width / 40),
                        Text(
                          "Sign in With Google",
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height / 45,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
