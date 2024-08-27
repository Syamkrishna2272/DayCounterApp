import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsappIconWidget extends StatelessWidget {
  const WhatsappIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ()async {
      //   final Uri url=Uri.parse('https://www.linkedin.com/company/dhoomatech/');
      //   if(await canLaunchUrl(url)){
      //     await launchUrl(url);
      //   }else{
      //     throw 'could not launch $url';
      //   }
      // },
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