import 'package:flutter/material.dart';
import 'package:flutter_login/api_service.dart';

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
        title: Text('ข่าวสาร'),
        backgroundColor: Colors.black,
      ),
      body: newsList.isEmpty
          ? Center(
              child: Text(
                'ไม่มีข้อมูล',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4, // เพิ่มเงาให้กับ Card
                    margin: EdgeInsets.all(11), // ปรับขอบรอบ Card
                    child: ListTile(
                      title: Text(
                        '${newsList[index]['news_head']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black, // เพิ่มสีให้กับ Text
                        ),
                      ),
                      subtitle: Text(
                        newsList[index]['news_text'],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            newsList[index]['news_date']
                                .toString()
                                .substring(0, 10),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            newsList[index]['news_date']
                                .toString()
                                .substring(11, 19),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
