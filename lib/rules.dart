import 'package:flutter/material.dart';

class Rules extends StatefulWidget {
  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rules'),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("กฎข้อที่ ${index + 1}"),
              );
            }));
  }
}
