import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Successfully complete",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width / 30,
              color: Colors.white,
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor:
              const Color.fromARGB(255, 118, 117, 117).withOpacity(0.9),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 10),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 15,
              vertical: MediaQuery.sizeOf(context).width / 30),
        ),
      );

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
