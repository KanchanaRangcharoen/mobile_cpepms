import 'package:flutter/material.dart';
import 'package:flutter_login/page/menu.dart';
import 'package:flutter_login/user.dart';
import 'package:flutter_login/page/Assessmentresults.dart';
import 'package:flutter_login/page/home.dart';
import 'package:flutter_login/page/status.dart';
import 'package:flutter_login/timeTest.dart';

class StudentHome extends StatefulWidget {
  final String studentId;

  StudentHome({required this.studentId});

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int _tabBarIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _tabBarIndex = index;
    });
  }

  Future logout() async {
    await User.setSignIn(false);
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      Home(studentId: widget.studentId), // ให้ Home รับ studentId จาก widget.
      TimeTestScreen(),
      Status(),
      Results(),
      Menu(),
    ];
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Project Manager App',
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 74, 147, 231),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: CustomSearch());
              },
              color: Color.fromARGB(255, 74, 147, 231),
              iconSize: 30,
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            onTap: _onTabTapped,
            unselectedLabelColor: Color.fromARGB(255, 74, 147, 231),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 74, 147, 231),
                Color.fromARGB(255, 174, 124, 255),
              ]),
              borderRadius: BorderRadius.circular(40),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Test'),
              Tab(text: 'Result'),
              Tab(text: 'Status'),
              Tab(text: 'Menu'),
            ],
          ),
        ),
        body: IndexedStack(
          index: _tabBarIndex,
          children: _tabs.map((tab) => tab).toList(),
        ),
      ),
    );
  }
}
