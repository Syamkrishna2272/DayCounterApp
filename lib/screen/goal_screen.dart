import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/goal_add.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        body: SafeArea(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('goalcollection')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF2C69DE),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const GoalAdding();
                          },
                        );
                      },
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'list is empty!',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      'Tap on ‘+’ and create your first goal',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.all(MediaQuery.sizeOf(context).width / 28),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var doc = snapshot.data!.docs[index];
                            var createdAt = doc['createdAt'] as Timestamp;
                            var formattedDate = DateFormat('MMMM d, yyyy')
                                .format(createdAt.toDate());
                            return Card(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height / 9,
                                decoration: BoxDecoration(
                                    color: Color(0xFF34343E),
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.sizeOf(context).height /
                                            63)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width / 2,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doc['Tittle'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          20),
                                            ),
                                            Text('Mark on $formattedDate',
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xFF2C69DE),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const GoalAdding();
                          },
                        );
                      },
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        )));
  }
}
