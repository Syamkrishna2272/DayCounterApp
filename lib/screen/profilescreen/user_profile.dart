import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_counter/screen/profilescreen/widget/facebook_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/instagram_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/linkedin_icon.dart';
import 'package:day_counter/screen/profilescreen/widget/whatsapp_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedimage;
  String? _imageUrl;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FocusNode _namefocus = FocusNode();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _namefocus.addListener(() {
      setState(() {
        _isEditing = _namefocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _namefocus.dispose();
    super.dispose();
  }

  Future<void> _fetchUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      _emailController.text = user.email ?? '';
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          _nameController.text = userData['name'] ?? '';
          _imageUrl = userData['imageUrl'] ?? '';
        });
      }
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedimage = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _uploadImageAndData() async {
    // Check if only the name is missing
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter your name',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width / 20,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 28),
          ),
        ),
      );
    }

    // Proceed to upload the image if selected, but don't block the name update
    try {
      // If an image is selected, upload it
      String? imageUrl;
      if (_selectedimage != null) {
        // Check if there's an existing image URL and delete the old image
        if (_imageUrl != null && _imageUrl!.isNotEmpty) {
          Reference oldImageRef =
              FirebaseStorage.instance.refFromURL(_imageUrl!);
          await oldImageRef.delete();
        }

        // Upload the new image
        String fileName = '${_auth.currentUser!.uid}.jpg';
        Reference storageRef =
            FirebaseStorage.instance.ref().child('profile_images/$fileName');
        UploadTask uploadTask = storageRef.putFile(_selectedimage!);
        TaskSnapshot taskSnapshot = await uploadTask;
        imageUrl = await taskSnapshot.ref.getDownloadURL();
      }

      // Update Firestore with the new data
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        'name': _nameController.text,
        'imageUrl': imageUrl ?? _imageUrl,
        'email': _emailController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Profile updated successfully!',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width / 20,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 28),
          ),
        ),
      );
      setState(() {
        _isEditing = false;
        _namefocus.unfocus();
      });
    } catch (e) {
      print('Error uploading data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload data')),
      );
    }
  }

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
              child: Visibility(
                visible: _isEditing,
                child: InkWell(
                  onTap: () {
                    _uploadImageAndData();
                  },
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
                onTap: _pickImage,
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
                        : _imageUrl != null && _imageUrl!.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(_imageUrl!),
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
                  focusNode: _namefocus,
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
                  readOnly: true,
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
                  const WhatsappIconWidget(
                    phoneNumber: '8891416677',
                    countryCode: '+91',
                  ),
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
}
