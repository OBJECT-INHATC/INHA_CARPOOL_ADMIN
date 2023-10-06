import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inha_carpool_admin/screen/reportDetail.dart';
import 'package:inha_carpool_admin/service/ApiSevice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ApiService apiService = ApiService();

  TextEditingController textFieldController = TextEditingController();

  String reporterName = '';

  List<dynamic> reportList = [];

  void getText() {
    setState(() {
      reporterName = textFieldController.text; // 버튼이 눌렸을 때 값을 저장
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('신고 내역'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                        hintText: '신고한 사용자 닉네임 입력',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        // 텍스트 불러오기
                        getText();
                        // 신고 내역 불러오기
                        final response = await apiService.selectReportList(reporterName);

                        if (response.statusCode == 200) {
                          String responseBody = utf8.decode(response.bodyBytes);
                          print('Response Body: $responseBody'); // 응답 확인을 위한 로그 출력

                          Map<String, dynamic> responseData = json.decode(responseBody);
                          setState(() {
                            reportList = responseData['result']['getReportList'] ?? [];
                          });
                        }
                      }
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reportList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${reportList[index]['reporter']['nickname']} 님의 신고'),
                    subtitle: Text('${reportList[index]['reportType']}으로 ${reportList[index]['reportedUser']['nickname']}을 신고'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ReportDetailPage( // 신고 상세조회 페이지로 이동
                            content: reportList[index]['content'],
                            carpoolId: reportList[index]['carpoolId'],
                            reportedUserUid: reportList[index]['reportedUser']['uid'],
                            reportedUserNickName: reportList[index]['reportedUser']['nickname'],
                            reportedUserEmail: reportList[index]['reportedUser']['email'],
                            reporterUid: reportList[index]['reporter']['uid'],
                            reporterNickName: reportList[index]['reporter']['nickname'],
                            reporterEmail: reportList[index]['reporter']['email'],
                            reportType: reportList[index]['reportType'],
                            reportDate: reportList[index]['reportDate'],
                          ))
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
