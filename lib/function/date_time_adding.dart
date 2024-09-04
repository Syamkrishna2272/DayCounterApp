import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

startcount({
  required TextEditingController tittlecontroller,
  required TextEditingController daycontroller,
  required String userId,
  required BuildContext context,
}) {
  if (tittlecontroller.text.isEmpty || daycontroller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFFF44336),
        content: Text('Complete the Details'),
      ),
    );
    return;
  } else {
    final CollectionReference firedata = FirebaseFirestore.instance
        .collection('goalcollection')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('goals');

    int endDay = int.parse(daycontroller.text);
    final DateTime startdate = DateTime.now();
    final DateTime endDate = startdate.add(Duration(days: endDay));

    final data = {
      'Tittle': tittlecontroller.text,
      'StartDate': startdate,
      'EndDate': endDate,
      'userId': userId,
    };

    firedata.add(data).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully complete"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ));
      Navigator.of(context).pop();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to add data: $error"),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
