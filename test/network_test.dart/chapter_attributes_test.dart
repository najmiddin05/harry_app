import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/chapters_atributes.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("chapters data test", () {
    test("chapters data book one test", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final getData = data as Map<String, dynamic>;
      final relationships = getData["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapter = getRelationships["chapters"] as Map;
      final getChapter = chapter as Map<String, dynamic>;
      final chapterData = getChapter["data"] as List;
      final getChapterData = ChaptersAttributes.fromJson(
          chapterData.first as Map<String, Object?>);
      debugPrint(
        (getChapterData.id),
      );
      // expect(getChapterData, const TypeMatcher<ChaptersData>());
    });

    test("chapters data book all test", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      final getData = data.map((e) => e as Map<String, dynamic>);
      final relationships = getData.first["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapter = getRelationships["chapters"] as Map;
      final getChapter = chapter as Map<String, dynamic>;
      final chapterData = getChapter["data"] as List;
      final getChapterData = ChaptersAttributes.fromJson(
          chapterData.first as Map<String, Object?>);
      debugPrint(
        (getChapterData.id),
      );
      // expect(getChapterData, const TypeMatcher<ChaptersData>());
    });
  });
}
