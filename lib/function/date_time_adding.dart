import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

startcount(
    {required TextEditingController tittlecontroller,
    required TextEditingController daycontroller,
    context}) {
  if (tittlecontroller.text.isEmpty || daycontroller.text.isEmpty) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFFF44336),
        content: Text('Complete the Details'),
      ),
    );
  } else {
    final CollectionReference firedata =
        FirebaseFirestore.instance.collection('goalcollection');
    int endDay = int.parse(daycontroller.text);
    final DateTime startdate = DateTime.now();
    final DateTime endDate = startdate.add(Duration(days: endDay));
    final data = {
      'Tittle': tittlecontroller.text,
      'StartDate': startdate,
      'EndDate': endDate
    };
    firedata.add(data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successfully complete"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
    Navigator.of(context).pop();
  }
}
