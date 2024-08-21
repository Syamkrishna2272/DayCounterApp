import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text("My Profile",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500))),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 30,
              ),
              Container(
                  width: MediaQuery.sizeOf(context).width / 3,
                  height: MediaQuery.sizeOf(context).width / 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 8.5,
                    right: MediaQuery.sizeOf(context).width / 8.5),
                child: const TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "your name here",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 8.5,
                    right: MediaQuery.sizeOf(context).width / 8.5),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "email address here",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 4.2,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 16,
                width: MediaQuery.sizeOf(context).width / 2.6,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 71, 71),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width / 3),
                ),
                child: Center(
                  child: Text(
                    "follow us",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width / 22,
                        color: const Color(0xFFB0B0B0),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
