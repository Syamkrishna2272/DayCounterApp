import 'package:flutter/material.dart';

class DayAdding extends StatelessWidget {
  const DayAdding({
    super.key,
    required this.daycontroller,
  });

  final TextEditingController daycontroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 16,
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: TextField(
            controller: daycontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Days (Mandatory)",
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width / 45),
              ),
              fillColor: const Color(0xFF121212),
              filled: true,
            ),
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height / 63,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            cursorColor: Colors.white,
          ),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height / 16,
          width: MediaQuery.sizeOf(context).width / 2.6,
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 45),
          ),
          child: Center(
            child: Text(
              "DAYS",
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width / 18,
                  color: const Color(0xFFB0B0B0),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
