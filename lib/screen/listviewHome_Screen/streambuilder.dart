import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/addDialogscreen/goal_add_screen.dart';
import 'package:day_counter/screen/listviewHome_Screen/popup2.dart';
import 'package:day_counter/screen/listviewHome_Screen/Date_time_showing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamWidget extends StatelessWidget {
  const StreamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('goalcollection')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('goals')
          .orderBy('StartDate', descending: true)
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
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 9,
                  width: MediaQuery.sizeOf(context).width,
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
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: MediaQuery.sizeOf(context).width / 8,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 42),
                Text(
                  'list is empty!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).width / 22,
                      fontWeight: FontWeight.w700),
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
                        var createdAt = doc['StartDate'] as Timestamp;
                        var formattedDate = DateFormat('MMMM d, yyyy')
                            .format(createdAt.toDate());
                        dynamic startdate =
                            (doc['StartDate'] as Timestamp).toDate();
                        dynamic enddate =
                            (doc['EndDate'] as Timestamp).toDate();
                        return Card(
                          child: Container(
                            height: MediaQuery.sizeOf(context).height / 8,
                            decoration: BoxDecoration(
                                color: const Color(0xFF34343E),
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.sizeOf(context).height / 75)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2,
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
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .width /
                                                      20),
                                        ),
                                        Text('Mark on $formattedDate',
                                            style: TextStyle(
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        30,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                                DayTimeShowing(
                                  data: doc,
                                  startDate: startdate,
                                  endDate: enddate,
                                ),
                                PopUp2(doc: doc),
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
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 15),
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF2C69DE),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const GoalAdding(); //goal adding
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
    );
  }
}
