import 'package:harry_app/model/pagination.dart';

class Meta {
  String copyright;
  String generatedAt;
  Pagination? pagination;

  Meta({
    required this.copyright,
    required this.generatedAt,
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, Object?> json) {
    return Meta(
      copyright: json["copyright"] as String,
      generatedAt: json["generated_at"] as String,
      pagination: json["pagination"] != null
          ? Pagination.fromJson(json["pagination"] as Map<String, dynamic>)
          : null,
    );
  }
}
