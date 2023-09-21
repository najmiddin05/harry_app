import 'package:harry_app/model/api_response/chapters_atributes.dart';

class ChapterData {
  ChaptersAttributes data;
  ChapterData({required this.data});
  factory ChapterData.fromJson(Map<String, Object?> json) {
    return ChapterData(
      data: ChaptersAttributes.fromJson(json["data"] as Map<String, dynamic>),
    );
  }
}
