import 'package:flutter/material.dart';
import '../user.dart';

class menu extends StatefulWidget {
  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  Future logout() async {
    await User.setsignin(false);
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          backgroundColor: Colors.black,
        ),
        body: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Theme.of(context).splashColor,
            child: ListTile(
                onTap: () {
                  logout();
                },
                title: Text('Logout'),
                leading: Icon(Icons.logout)),
          ),
        ));
  }
}
