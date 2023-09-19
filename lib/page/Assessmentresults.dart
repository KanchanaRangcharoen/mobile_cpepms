import 'package:flutter/material.dart';
import '../user.dart';

class Results extends StatefulWidget {
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
              "Results Screen",
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
