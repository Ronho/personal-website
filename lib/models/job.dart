class Job {
  final String id;
  final String role;
  final String position;
  final DateTime startDate;
  final dynamic endDate; // String or DateTime
  final String summary;
  final String body;
  final List<String> tagIds;

  Job({
    required this.role,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.id,
    required this.tagIds,
    required this.summary,
    required this.body,
  });

  factory Job.fromJson(Map<dynamic, dynamic> json) {
    return Job(
      id: json['id'].toString(),
      tagIds: (json['tagIds'] as List).map((item) => item as String).toList(),
      startDate: DateTime.parse(json['startDate']),
      role: json['role'].toString(),
      summary: json['summary'].toString(),
      body: json['body'].toString(),
      position: json['position'].toString(),
      endDate: Job.stringToDateOrString(json['endDate']),
    );
  }

  static dynamic stringToDateOrString(String date) {
    if (date.toLowerCase() == 'present') {
      return 'Present';
    } else {
      try {
        return DateTime.parse(date);
      } on Error catch (e) {
        throw ArgumentError.value(date);
      }
    }
  }
}
