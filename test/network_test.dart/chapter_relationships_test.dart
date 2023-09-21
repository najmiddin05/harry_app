import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/chapters_relationships.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("chapters relationships test", () {
    test("chapters relationships data one test", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final getData = data as Map<String, dynamic>;
      final relationships = getData["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapterMapData = ChapterRelationships.fromJson(getRelationships);
      debugPrint(chapterMapData.chapters!.data.list.first.id);
      expect(chapterMapData, const TypeMatcher<ChapterRelationships>());
    });

    test("chapters relationships data all test", () async {
      final response = await Network.methodGet(
        api: Api.apiBook,
      );
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      final getData = data.map((e) => e as Map<String, dynamic>);
      final relationships = getData.first["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final chapterMapData = ChapterRelationships.fromJson(getRelationships);
      debugPrint(chapterMapData.chapters!.data.list.first.id);
      expect(chapterMapData, const TypeMatcher<ChapterRelationships>());
    });
  });
}
