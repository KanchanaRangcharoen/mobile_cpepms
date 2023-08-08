// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_login/page/menu.dart';
import 'package:flutter_login/user.dart';
import 'package:flutter_login/pageT/assessment.dart';
import 'package:flutter_login/pageT/project.dart';
import 'package:flutter_login/pageT/homeT.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_login/page/examTime.dart';

class teacherhome extends StatefulWidget {
  const teacherhome({Key? key}) : super(key: key);

  @override
  State<teacherhome> createState() => _teacherhomeState();
}

class _teacherhomeState extends State<teacherhome> {
  int currentIndex = 0;

  void goToPade(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  final List<Widget> _pages = [
    homeT(),
    Project(),
    Assessmente(),
    timeTest(),
    menu()
  ];

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
              padding: EdgeInsets.all(11),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'HomeT',
                ),
                GButton(
                  icon: Icons.folder,
                  text: 'Project',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'Assessmente',
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
