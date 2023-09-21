import 'package:harry_app/model/api_response/chapters_map.dart';

import '../chapter/chapter_book.dart';

class ChapterRelationships {
  ChaptersMap? chapters;
  ChapterBook? relation;

  ChapterRelationships({
    required this.chapters,
    required this.relation,
  });

  factory ChapterRelationships.fromJson(Map<String, Object?> json) {
    return ChapterRelationships(
        chapters: json["chapters"] != null
            ? ChaptersMap.fromJson(json["chapters"] as Map<String, Object?>)
            : null,
        relation: json["relationships"] != null
            ? ChapterBook.fromJson(
                json["relationships"] as Map<String, Object?>)
            : null);
  }
}
