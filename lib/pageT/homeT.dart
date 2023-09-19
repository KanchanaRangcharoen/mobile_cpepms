// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_login/download.dart';
import 'package:flutter_login/pageT/My_button.dart';
import 'package:flutter_login/news.dart';
import 'package:flutter_login/pageT/appoint.dart';
import 'package:flutter_login/rules.dart';
import 'package:flutter_login/api_service.dart';

class homeT extends StatefulWidget {
  @override
  State<homeT> createState() => _homeTState();
}

class _homeTState extends State<homeT> {
  List<dynamic> appointT = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchappointT();
  }

  Future<void> fetchappointT() async {
    ApiService apiService = ApiService();
    try {
      List<dynamic> data = await apiService.getappointT();
      setState(() {
        appointT = data;
      });
    } catch (e) {
      print(e);
    }
  }

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'กำหนดการในรายวิชาโครงงาน',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              // ใช้ Expanded เพื่อให้ ListView สามารถขยายตามข้อมูลได้
              child: buildAppointList(), // แสดงรายการกำหนดการ
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: goToPade,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Appoint',
          ),
        ],
      ),
    );
  }

  Widget buildAppointList() {
    if (appointT.isEmpty) {
      return const Center(
        child: Text(
          'ไม่มีข้อมูล',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: appointT.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              '${appointT[index]['title']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              '${appointT[index]['description']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  appointT[index]['appoint_date'].toString().substring(0, 10),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  appointT[index]['appoint_date'].toString().substring(11, 19),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
