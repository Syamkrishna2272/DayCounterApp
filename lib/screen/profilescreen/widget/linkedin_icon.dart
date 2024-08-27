import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedinIconWidget extends StatelessWidget {
  const LinkedinIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(
            'https://www.linkedin.com/company/dhoomatech/');
        if (await launchUrl(url,
            mode: LaunchMode.externalApplication)) {
        } else {
          throw 'could not launch $url';
        }
        ;
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFB0B0B0),
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
          radius: MediaQuery.sizeOf(context).width / 18,
          backgroundColor: Colors.transparent,
          child: const FaIcon(FontAwesomeIcons.linkedin,
              color: Colors.white),
        ),
      ),
    );
  }
}