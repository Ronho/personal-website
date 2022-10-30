class Blog {
  final String id;
  final DateTime date;
  final List<String> authors;
  final bool isPublished;
  final String thumbnailPath;
  final DateTime lastUpdated;
  final String title;
  final String summary;
  final String body;

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
      body: json['body'].toString(),
    );
  }

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
}
