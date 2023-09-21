import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/chapters_atributes.dart';
import 'package:harry_app/model/api_response/chapters_relationships.dart';
import 'package:harry_app/model/chapter/chapter.dart';
import 'package:harry_app/model/chapter/chapter_book.dart';
import 'package:harry_app/model/chapter/chapter_data.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("chapter attributes", () {
    test("chapter one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
              "/chapters"
              "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final chapter = Chapter.fromJson(getAttributes);
      debugPrint("summry: ${chapter.title}");
      expect(chapter, const TypeMatcher<Chapter>());
    });

    test("chapter one", () async {
      final response = await Network.methodGet(
        api: Api.apiBook,
        id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7" "/chapters",
      );
      List<Chapter> chapter;
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      chapter = data.map((element) {
        final item = element as Map;
        final attributes = item["attributes"] as Map;
        return Chapter.fromJson(attributes as Map<String, dynamic>);
      }).toList();
      debugPrint("slug: ${chapter.first.slug}");
      expect(chapter, hasLength(data.length));
    });

    test("chapter get id type one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
              "/chapters"
              "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data1 = json["data"];
      final getData1 = data1 as Map<String, dynamic>;
      final relationships = getData1["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final book = getRelationships["book"] as Map;
      final getBook = book as Map<String, dynamic>;
      final data = getBook["data"] as Map;
      final getData = data as Map<String, dynamic>;
      final chapter = ChaptersAttributes.fromJson(getData);
      debugPrint("type: ${chapter.type}");
      expect(chapter, const TypeMatcher<ChaptersAttributes>());
    });

    test("chapter get data one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
              "/chapters"
              "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data1 = json["data"];
      final getData1 = data1 as Map<String, dynamic>;
      final relationships = getData1["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;
      final book = getRelationships["book"] as Map;
      final getBook = book as Map<String, dynamic>;
      final chapter = ChapterData.fromJson(getBook);
      debugPrint("type: ${chapter.data.id}");
      expect(chapter, const TypeMatcher<ChapterData>());
    });

    test("chapter get book data one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
              "/chapters"
              "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data1 = json["data"];
      final getData1 = data1 as Map<String, dynamic>;
      final relationships = getData1["relationships"] as Map;
      final getBook = relationships as Map<String, dynamic>;
      final chapter = ChapterBook.fromJson(getBook);
      debugPrint("type: ${chapter.book.data.id}");
      expect(chapter, const TypeMatcher<ChapterBook>());
    });

    test("chapter get relationships book data one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
              "/chapters"
              "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final relationships = json["data"] as Map;
      final getBook = relationships as Map<String, dynamic>;
      final chapter = ChapterRelationships.fromJson(getBook);
      debugPrint("type: ${chapter.relation!.book.data.id}");
      expect(chapter, const TypeMatcher<ChapterRelationships>());
    });

    // test("data books relation one", () async {
    //   final response = await Network.methodGet(
    //       api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7"
    //       // "/chapters"
    //       // "/fc856b8e-bbf2-45c4-af24-00c7ba7b5978"
    //       );
    //   final json = jsonDecode(response!);
    //   final data = json["data"] as Map;
    //   final dataModel = Data<Book>.fromJson(data as Map<String, dynamic>);
    //   debugPrint(
    //       "chapter id: ${dataModel.relationships!.chapters.data.list.first.id}");
    //   debugPrint("id: ${dataModel.id}");
    //   expect(dataModel, const TypeMatcher<Data<Book>>());
    // });
  });
}
