import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "http://172.16.3.169/cpepms/regulation.php"; // ใส่ URL ของไฟล์ PHP ที่เชื่อมต่อกับ MySQL

  Future<List<dynamic>> getRulesData() async {
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

class Rules extends StatefulWidget {
  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  List<dynamic> rulesList = [];
  @override
  void initState() {
    super.initState();
    fetchRulesData();
  }

  Future<void> fetchRulesData() async {
    ApiService apiService = ApiService();
    try {
      List<dynamic> data = await apiService.getRulesData();
      setState(() {
        rulesList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rules'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: rulesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${rulesList[index]['regulation_id']}  ${rulesList[index]['regulation_head']}'),
            subtitle: Text(rulesList[index]['regulation_text']),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Y ' '${rulesList[index]['year'].toString()}'),
                Text('T ' '${rulesList[index]['term'].toString()}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
