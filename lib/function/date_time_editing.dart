import 'package:cloud_firestore/cloud_firestore.dart';
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

  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('goalcollection');

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
    const SnackBar(
      content: Text("Successfully Updated"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );

  Navigator.of(context).pop();
}
