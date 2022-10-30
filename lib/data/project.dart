class Project {
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
}
