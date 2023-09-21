final map = {
  "slug": "the-boy-who-lived",
  "title": "The Boy Who Lived",
  "summary": "",
  "order": 1
};

class Chapter {
  String slug;
  String title;
  String? summary;
  int order;

  Chapter({
    required this.slug,
    required this.title,
    required this.summary,
    required this.order,
  });

  factory Chapter.fromJson(Map<String, Object?> json) {
    return Chapter(
      slug: json["slug"] as String,
      title: json["title"] as String,
      summary: json["summary"] as String?,
      order: json["order"] as int,
    );
  }
}
