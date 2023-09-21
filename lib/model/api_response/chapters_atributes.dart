class ChaptersAttributes {
  String id;
  String type;

  ChaptersAttributes({
    required this.id,
    required this.type,
  });

  factory ChaptersAttributes.fromJson(Map<String, Object?> json) {
    return ChaptersAttributes(
      id: json["id"] as String,
      type: json["type"] as String,
    );
  }
}
