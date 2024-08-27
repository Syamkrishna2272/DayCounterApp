import 'package:flutter/material.dart';
import 'package:day_counter/screen/homeScreen/popup.dart';
import 'package:day_counter/screen/listviewHome_Screen/streambuilder.dart';
import 'package:day_counter/screen/profilescreen/user_profile.dart';

class GoalCounterScreen extends StatefulWidget {
  const GoalCounterScreen({super.key});

  @override
  _GoalCounterScreenState createState() => _GoalCounterScreenState();
}

class _GoalCounterScreenState extends State<GoalCounterScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const StreamWidget(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF121212),
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: const Color(0xFF121212),
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  }));
                },
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: const Center(
                child: Text(
                  "Goal Counter",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              actions: const [
                PopUp1(),
              ],
            )
          : null,
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF121212),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Goal Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
