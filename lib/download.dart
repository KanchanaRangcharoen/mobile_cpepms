import 'package:flutter/material.dart';
import 'package:flutter_login/user.dart';

class Downlond extends StatefulWidget {
  @override
  State<Downlond> createState() => _DownlondState();
}

class _DownlondState extends State<Downlond> {
  Future logout() async {
    await User.setSignIn(false);
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Downlond'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'เอกสารในรายวิชาโครงงาน',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("เอกสาร ${index + 1}"),
                      );
                    }))
          ],
        ));
  }
}
