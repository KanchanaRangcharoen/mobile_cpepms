import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Appoint extends StatefulWidget {
  @override
  State<Appoint> createState() => _AppointState();
}

class _AppointState extends State<Appoint> {
  List<dynamic> appoint = [];

  @override
  void initState() {
    super.initState();
    fetchappointData();
  }

  Future<void> fetchappointData() async {
    final response = await http.get(
      Uri.parse(
          "http://172.16.3.169/cpepms/appoint.php"), // ให้แก้ URL ตามที่คุณใช้งาน
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        appoint = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appoint'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: appoint.length,
        itemBuilder: (context, index) {
          final appointment = appoint[index];
          return ListTile(
            title: Text(appointment['title'] ?? ''),
            subtitle: Text(appointment['description'] ?? ''),
            trailing: Text(appointment['appoint_date'] ?? ''),
          );
        },
      ),
    );
  }
}
