import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:day_counter/screen/introScreen/intro_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

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
            sendEmail();
            break;
          case 2:
            userLogout(context); 
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 1,
          child: Text("Send Feedback"),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text("Logout"),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }

  Future<void> userLogout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const IntroPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  Future<void> sendEmail() async {
    final Uri emaillaunchUri = Uri(
        scheme: 'mailto',
        path: '	info@dhoomatech.com',
        queryParameters: {'subject': 'Feedback'});
    try {
      await launchUrl(emaillaunchUri);
    } catch (e) {
      print("Could not launch email app: $e");
    }
  }
}
