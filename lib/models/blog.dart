import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/search_bar_item.dart';

class Blog {
  final String id;
  final DateTime date;
  final List<String> authors;
  final bool isPublished;
  final String thumbnailPath;
  final DateTime lastUpdated;
  final String title;
  final String summary;
  final String bodyReference;
  late String body;

  Blog({
    required this.id,
    required this.authors,
    required this.isPublished,
    required this.thumbnailPath,
    required this.date,
    required this.lastUpdated,
    required this.title,
    required this.summary,
    required this.body,
    required this.bodyReference,
  });

  factory Blog.fromJson(Map<dynamic, dynamic> json) {
    return Blog(
      id: json['id'].toString(),
      authors: (json['authors'] as List).map((item) => item as String).toList(),
      thumbnailPath: json['thumbnail'].toString(),
      isPublished: json['isPublished'],
      date: DateTime.parse(json['date']),
      lastUpdated: DateTime.parse(json['lastUpdated']),
      title: json['title'].toString(),
      summary: json['summary'].toString(),
      body: '',
      bodyReference: json['bodyReference'].toString(),
    );
  }

  static IconData get icon => Icons.feed;

  String get authorsAsString {
    String text = '';
    for (String entry in authors) {
      if (text == '') {
        text += entry;
      } else {
        text += ', $entry';
      }
    }

    return text;
  }

  SearchBarItem get asSearchbarItem {
    return SearchBarItem(
        icon: icon,
        text: title,
        category: 'blogs',
        onTap: () => Get.toNamed('/blog/$id'));
  }

  bool containsText(String text) {
    text = text.toLowerCase();
    return title.toLowerCase().contains(text) |
        summary.toLowerCase().contains(text) |
        body.toLowerCase().contains(text) |
        authors.any((val) => val.toLowerCase().contains(text));
  }

  Future<void> getText() async {
    body = await rootBundle.loadString('assets/data/blogs/$bodyReference.md');
  }
}
