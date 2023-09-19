import 'package:flutter/material.dart';
import 'package:flutter_login/user.dart';

class Assessmente extends StatefulWidget {
  @override
  State<Assessmente> createState() => _AssessmenteState();
}

class _AssessmenteState extends State<Assessmente> {
  Future logout() async {
    await User.setSignIn(false);
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Assessmente Screen",
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
