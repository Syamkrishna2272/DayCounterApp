import 'package:cloud_firestore/cloud_firestore.dart';
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
        } else if (value == 'Delete') {
          FirebaseFirestore.instance
              .collection('goalcollection')
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