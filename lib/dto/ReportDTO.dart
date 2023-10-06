class ReportDTO {
  String content;
  String carpoolId;
  String reportedUserUid;
  String reportedUserNickName;
  String reportedUserEmail;
  String reporterUid;
  String reporterNickName;
  String reporterEmail;
  String reportType;
  String reportDate;

  ReportDTO({
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


}


