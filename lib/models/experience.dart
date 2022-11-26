import 'dart:ui';

import 'job.dart';

class Experience {
  final String id;
  final String company;
  final String link;
  final Color textColor;
  final Color backgroundColor;
  final String logoPath;
  final List<Job> jobs;

  Experience({
    required this.company,
    required this.link,
    required this.textColor,
    required this.backgroundColor,
    required this.id,
    required this.logoPath,
    required this.jobs,
  });

  factory Experience.fromJson(Map<dynamic, dynamic> json) {
    return Experience(
      id: json['id'].toString(),
      backgroundColor: Experience.colorFromList(json['backgroundColor']),
      textColor: Experience.colorFromList(json['textColor']),
      link: json['link'].toString(),
      company: json['company'].toString(),
      logoPath: json['logo'].toString(),
      jobs: Experience.jobsFromJson(json['jobs']),
    );
  }

  static List<Job> jobsFromJson(List<dynamic> jobs) {
    return jobs.map((x) => Job.fromJson(x)).toList();
  }

  static Color colorFromList(List<dynamic> rgbo) {
    return Color.fromRGBO(
      rgbo[0].toInt(),
      rgbo[1].toInt(),
      rgbo[2].toInt(),
      rgbo[3],
    );
  }
}
