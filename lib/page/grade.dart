import 'package:flutter/material.dart';
import '../user.dart';

class grade extends StatefulWidget {
  @override
  State<grade> createState() => _gradeState();
}

class _gradeState extends State<grade> {
  Future logout() async {
    await User.setSignIn(false);
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "grade Screen",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
