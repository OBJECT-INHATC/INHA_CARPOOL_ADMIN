import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  /// 신고자 이름으로 신고 내역 조회
  Future<http.Response> selectReportList(String nickname) async {

    String apiUrl = 'http://54.180.105.67:8080/report/select/$nickname';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(jsonDecode(utf8.decoder.convert(response.bodyBytes)));
    return response;
  }

}