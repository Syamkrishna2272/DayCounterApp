import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void editcount({
  required TextEditingController tittlecontroller,
  required TextEditingController daycontroller,
  required DocumentSnapshot doc,
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
  }

  final CollectionReference firedata = FirebaseFirestore.instance
      .collection('goalcollection')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('goals');

  Map<String, dynamic> data = {
    'Tittle': tittlecontroller.text,
  };

  if (daycontroller.text.isNotEmpty) {
    int endDay = int.parse(daycontroller.text);
    final DateTime startdate = doc['StartDate'].toDate();
    final DateTime endDate = startdate.add(Duration(days: endDay));

    data.addAll({
      'StartDate': startdate,
      'EndDate': endDate,
    });
  }

  firedata.doc(doc.id).update(data);

  ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(
          content: Text(
            "Successfully Updated",
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
}
