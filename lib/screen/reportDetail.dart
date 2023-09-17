import 'package:flutter/material.dart';

class ReportDetailPage extends StatelessWidget {
  final String content;
  final String carpoolId;
  final String userName;
  final String reporter;
  final String reportType;
  final String reportDate;

  ReportDetailPage({
    required this.content,
    required this.carpoolId,
    required this.userName,
    required this.reporter,
    required this.reportType,
    required this.reportDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('신고 상세조회'),
      ),
      body: Padding(
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
                title: Text('피신고자'),
                subtitle: Text(userName),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('신고자'),
                subtitle: Text(reporter),
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
    );
  }
}
