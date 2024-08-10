import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF2C69DE),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.sizeOf(context).width / 25),
                              color: const Color(0xFF34343E),
                            ),
                            height: MediaQuery.sizeOf(context).height / 2.2,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Create your Goal",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              MediaQuery.sizeOf(context).width /
                                                  20,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Create Your Countdown Timer. Start tracking your",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "journey to success today!",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height / 25),
                                const Text(
                                  "Title*",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height / 15,
                                  width: MediaQuery.sizeOf(context).width / 1.4,
                                  color: const Color(0xFF121212),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Enter title (Mandatory)",
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF34343E),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.sizeOf(context).width /
                                                30),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                    ),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).height /
                                              50,
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )));
  }
}
