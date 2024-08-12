import 'package:flutter/material.dart';

class PopUp1 extends StatelessWidget {
  const PopUp1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
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
    );
  }
}