import 'package:harry_app/model/chapter/chapter_data.dart';

class ChapterBook {
  ChapterData book;
  ChapterBook({required this.book});
  factory ChapterBook.fromJson(Map<String, Object?> json) {
    return ChapterBook(
        book: ChapterData.fromJson(json["book"] as Map<String, dynamic>));
  }
}
