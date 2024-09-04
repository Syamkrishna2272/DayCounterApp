import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappIconWidget extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;
  const WhatsappIconWidget(
      {super.key, required this.phoneNumber, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final String fullphonenumber = '$countryCode$phoneNumber';
        final Uri url = Uri.parse('https://wa.me/+$fullphonenumber');
        if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
        } else {
          throw 'could not launch $url';
        }
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
          child: const FaIcon(
            FontAwesomeIcons.whatsapp,
            color: Color(0xFF25D366),
          ),
        ),
      ),
    );
  }
}
