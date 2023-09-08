import 'package:electricity_company/constants/colors.dart';
import 'package:electricity_company/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home/profile.dart';
import 'home/user_forms.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  int currentIndex = 0;
  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List _pages = [
    const Home(),
    const UserForms(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      backgroundColor: tdGrey,
      bottomNavigationBar: Container(
        color: const Color.fromARGB(99, 21, 79, 126),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              onTabChange: (index) => goToPage(index),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(163, 21, 79, 126),
              tabBorderRadius: 50,
              gap: 8,
              padding: const EdgeInsets.all(12),
              textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              tabs: const [
                GButton(icon: Icons.file_present_outlined, text: 'المعاملات'),
                GButton(
                  icon: Icons.file_copy_outlined,
                  text: "معاملاتي",
                ),
                GButton(
                  icon: Icons.person,
                  text: "ملفي",
                ),
              ]),
        ),
      ),
    );
  }
}
