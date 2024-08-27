import 'dart:io';
import 'package:day_counter/screen/profilescreen/widget/facebook_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/instagram_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/linkedin_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/whatsapp_icon.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedimage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            const Center(
              child: Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue.withOpacity(0.3),
                highlightColor: Colors.blue.withOpacity(0.3),
                child: Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).width / 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 30,
              ),
              GestureDetector(
                onTap: () async {
                  await addSellerProfileImage();
                  await addUserProfileToDb();
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 3,
                  height: MediaQuery.sizeOf(context).width / 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: _selectedimage != null
                        ? DecorationImage(
                            image: FileImage(_selectedimage!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('asset/img/Ellipse 52.png'),
                          ),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 8.5,
                    right: MediaQuery.sizeOf(context).width / 8.5),
                child: TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: "your name here",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 28,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 8.5,
                    right: MediaQuery.sizeOf(context).width / 8.5),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "email address here",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 6,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 15,
                width: MediaQuery.sizeOf(context).width / 3,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 71, 71),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width / 3),
                ),
                child: Center(
                  child: Text(
                    "follow us",
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width / 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WhatsappIconWidget(),
                  SizedBox(width: MediaQuery.sizeOf(context).width / 30),
                  const LinkedinIconWidget(),
                  SizedBox(width: MediaQuery.sizeOf(context).width / 30),
                  const InstagramIconWidget(),
                  SizedBox(width: MediaQuery.sizeOf(context).width / 30),
                  const FacebookIconWidget(),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 35,
              ),
              Text("www.dhoomatech.com all rights reserved",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).width / 27,
                      color: const Color(0xFFB0B0B0),
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
      )),
    );
  }

  // Future<void> _pickImage() async {
  //   try {
  //     final pickedFile =
  //         await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       setState(() {
  //         userprofileimage = pickedFile.path;
  //       });
  //     } else {
  //       print('No image selected.');
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }
}

String? userprofileimage;

addSellerProfileImage() async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (file == null) {
    return;
  }
  userprofileimage = file.path;
}

Future<String?> addUserProfileToDb() async {
  if (userprofileimage == null) {
    return null;
  }

  String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDireImages = referenceRoot.child('images');
  Reference referenceImageToUpload = referenceDireImages.child(fileName);

  try {
    await referenceImageToUpload.putFile(File(userprofileimage!));
    String imageUrl = await referenceImageToUpload.getDownloadURL();
    userprofileimage == null;
    return imageUrl;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}
