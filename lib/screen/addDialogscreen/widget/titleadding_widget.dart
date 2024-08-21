import 'package:flutter/material.dart';

class TitleAdding extends StatelessWidget {
  const TitleAdding({
    super.key,
    required this.tittlecontroller,
  });

  final TextEditingController tittlecontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 15,
      child: TextField(
        controller: tittlecontroller,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: "Enter title (Mandatory)",
          hintStyle: const TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 45),
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
    );
  }
}
