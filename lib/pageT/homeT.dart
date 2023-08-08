// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_login/download.dart';
import 'package:flutter_login/user.dart';
import 'package:flutter_login/pageT/My_button.dart';
import 'package:flutter_login/news.dart';
import 'package:flutter_login/pageT/appoint.dart';
import 'package:flutter_login/rules.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homeT extends StatefulWidget {
  @override
  State<homeT> createState() => _homeTState();
}

class _homeTState extends State<homeT> {
  int currentIndex = 0;

  void goToPade(int index) {
    setState(() {
      currentIndex = index;
    });
    // เช่น หาก index เป็น 0 ก็ Navigate ไปยังหน้า News()
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => News()),
      );
    }
    // เช่น หาก index เป็น 1 ก็ Navigate ไปยังหน้า Appoint()
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Appoint()),
      );
    }
  }

  final List<Widget> _pages = [Downlond(), Rules()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: const Text('Project Manager App'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: CustomSearch());
                },
                icon: const Icon(Icons.search)),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      iconImagePath: 'assets/img/filedownlond.png',
                      buttonText: 'Download',
                      nextPageRoute: 'download',
                    ),
                    MyButton(
                      iconImagePath: 'assets/img/rules.png',
                      buttonText: 'Rules',
                      nextPageRoute: 'rules',
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'กำหนดการในรายวิชาโครงงาน',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: goToPade,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'News',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Appoint',
          ),
        ],
      ),
    );
  }
}
