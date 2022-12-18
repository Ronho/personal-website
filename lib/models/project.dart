import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:personal_website/models/search_bar_item.dart';

class Project {
  final String id;
  final List<String> tagIds;
  final List<String> authors;
  final bool isPublished;
  final String thumbnailPath;
  final DateTime date;
  final DateTime lastUpdated;
  final String title;
  final String summary;
  final String body;
  final String link;

  Project({
    required this.id,
    required this.tagIds,
    required this.authors,
    required this.isPublished,
    required this.thumbnailPath,
    required this.date,
    required this.lastUpdated,
    required this.title,
    required this.summary,
    required this.body,
    required this.link,
  });

  factory Project.fromJson(Map<dynamic, dynamic> json) {
    return Project(
      id: json['id'].toString(),
      tagIds: (json['tagIds'] as List).map((item) => item as String).toList(),
      authors: (json['authors'] as List).map((item) => item as String).toList(),
      thumbnailPath: json['thumbnail'].toString(),
      isPublished: json['isPublished'],
      date: DateTime.parse(json['date']),
      lastUpdated: DateTime.parse(json['lastUpdated']),
      title: json['title'].toString(),
      summary: json['summary'].toString(),
      body: json['body'].toString(),
      link: json['link'].toString(),
    );
  }

  static IconData get icon => Icons.view_kanban;

  void onTap() => launchUrl(Uri.parse(link));

  SearchBarItem get asSearchbarItem {
    return SearchBarItem(
        icon: icon,
        text: title,
        category: 'project',
        onTap: onTap);
  }

  bool containsText(String text) {
    text = text.toLowerCase();
    return title.toLowerCase().contains(text) |
    summary.toLowerCase().contains(text) |
    body.toLowerCase().contains(text) |
    authors.any((val) => val.toLowerCase().contains(text));
  }
}
