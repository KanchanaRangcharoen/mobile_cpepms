import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "http://192.168.1.9/cpepms/appoint.php"; // ใส่ URL ของไฟล์ PHP ที่เชื่อมต่อกับ MySQL

  Future<List<dynamic>> getappointData() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}

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
    ApiService apiService = ApiService();
    try {
      List<dynamic> data = await apiService.getappointData();
      setState(() {
        appoint = data;
      });
    } catch (e) {
      print(e);
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
          return ListTile(
            title: Text(
                '${appoint[index]['appoint_id']}  ${appoint[index]['title']}'),
            subtitle: Text(appoint[index]['description']),
            trailing: Text(appoint[index]['group_id'].toString()),
          );
        },
      ),
    );
  }
}
