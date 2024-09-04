import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/addDialogscreen/goal_add_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PopUp2 extends StatelessWidget {
  const PopUp2({
    super.key,
    required this.doc,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Edit') {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return GoalAdding(
              isEditPage: true,
              goaldata: doc,
            );
          }));
        } else if (value == 'Delete') {
          FirebaseFirestore.instance
              .collection('goalcollection')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection('goals')
              .doc(doc.id)
              .delete();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'Edit',
            child: Text('Edit list'),
          ),
          const PopupMenuItem(
            value: 'Delete',
            child: Text(
              'Delete',
              style: TextStyle(
                color: Color(0xFFF44336),
              ),
            ),
          ),
        ];
      },
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
