import 'package:flutter/material.dart';

class ReportDetailPage extends StatelessWidget {
  final String content;
  final String carpoolId;
  final String reportedUserUid;
  final String reportedUserNickName;
  final String reportedUserEmail;
  final String reporterUid;
  final String reporterNickName;
  final String reporterEmail;
  final String reportType;
  final String reportDate;

  ReportDetailPage({
    required this.content,
    required this.carpoolId,
    required this.reportedUserUid,
    required this.reportedUserNickName,
    required this.reportedUserEmail,
    required this.reporterUid,
    required this.reporterNickName,
    required this.reporterEmail,
    required this.reportType,
    required this.reportDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('신고 상세조회'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  title: Text('신고 내용'),
                  subtitle: Text(content),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Carpool ID'),
                  subtitle: Text(carpoolId),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('피신고자 UID'),
                  subtitle: Text(reportedUserUid),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('피신고자 닉네임'),
                  subtitle: Text(reportedUserNickName),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('피신고자 이메일'),
                  subtitle: Text(reportedUserEmail),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('신고자 UID'),
                  subtitle: Text(reporterUid),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('신고자 닉네임'),
                  subtitle: Text(reporterNickName),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('신고자 이메일'),
                  subtitle: Text(reporterEmail),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('신고 유형'),
                  subtitle: Text(reportType),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('신고 날짜'),
                  subtitle: Text(reportDate),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // 경고하기 버튼이 눌렸을 때의 동작 추가
                    },
                    child: Text('경고하기'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 정지시키기 버튼이 눌렸을 때의 동작 추가
                    },
                    child: Text('정지시키기'),
                  ),
                ],
              ),
            ],
          ),
      ),
      )
    );
  }
}
