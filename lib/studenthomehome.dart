// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_login/page/menu.dart';
import 'package:flutter_login/user.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_login/page/Assessmentresults.dart';
import 'package:flutter_login/page/examTime.dart';
import 'package:flutter_login/page/home.dart';
import 'package:flutter_login/page/status.dart';

class studenthome extends StatefulWidget {
  const studenthome({Key? key}) : super(key: key);

  @override
  State<studenthome> createState() => _studenthomeState();
}

class _studenthomeState extends State<studenthome> {
  int currentIndex = 0;

  void goToPade(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  final List<Widget> _pages = [home(), Status(), Results(), timeTest(), menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: GNav(
              onTabChange: (index) => goToPade(index),
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 3,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.dashboard,
                  text: 'Status',
                ),
                GButton(
                  icon: Icons.grade,
                  text: 'Results',
                ),
                GButton(
                  icon: Icons.event,
                  text: 'TimeTest',
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'Menu',
                )
              ]),
        ),
      ),
    );
  }
}
