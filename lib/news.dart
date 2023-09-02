import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "http://172.16.3.169/cpepms/news.php"; // ใส่ URL ของไฟล์ PHP ที่เชื่อมต่อกับ MySQL

  Future<List<dynamic>> getNewsData() async {
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

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> newsList = [];
  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  Future<void> fetchNewsData() async {
    ApiService apiService = ApiService();
    try {
      List<dynamic> data = await apiService.getNewsData();
      setState(() {
        newsList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${newsList[index]['news_id']}  ${newsList[index]['news_head']}'),
            subtitle: Text(newsList[index]['news_text']),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(newsList[index]['news_date']
                    .toString()
                    .substring(0, 10)), // แสดงวันที่ (2023-07-13)
                Text(newsList[index]['news_date']
                    .toString()
                    .substring(11, 19)), // แสดงเวลา (15:22:31)
                Text('${newsList[index]['year']} ${newsList[index]['term']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
