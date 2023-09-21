import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/chapters_datas.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("chapters data test", () {
    test("chapters data book one test", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final getData = data as Map<String, dynamic>;
      final relationships = getData["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapter = getRelationships["chapters"] as Map;
      final getChapter = chapter as Map<String, dynamic>;
      final chapterData = getChapter["data"] as List;
      final getChapterData2 =
          chapterData.map((e) => e as Map<String, dynamic>).toList();
      final getChapterData = ChaptersData.fromJson(getChapterData2);
      for (var element in getChapterData.list) {
        debugPrint(element.id);
      }
      expect(getChapterData, const TypeMatcher<ChaptersData>());
    });

    test("chapters data book all test", () async {
      final response = await Network.methodGet(
        api: Api.apiBook,
      );
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      final getData = data.map((e) => e as Map<String, dynamic>);
      final relationships = getData.first["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapter = getRelationships["chapters"] as Map;
      final getChapter = chapter as Map<String, dynamic>;
      final chapterData = getChapter["data"] as List;
      final getChapterData2 =
          chapterData.map((e) => e as Map<String, dynamic>).toList();
      final getChapterData = ChaptersData.fromJson(getChapterData2);
      for (var element in getChapterData.list) {
        debugPrint(element.id);
      }
      expect(getChapterData, const TypeMatcher<ChaptersData>());
    });
  });
}
