import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/model/chapter/chapter.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/model/data.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/model/spell.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Data test", () {
    test("data book", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Book>.fromJson(data as Map<String, dynamic>);
      debugPrint("cove: ${dataModel.attributes.cover}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Book>>());
    });

    test("data books relationships one", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Book>.fromJson(data as Map<String, dynamic>);
      debugPrint(
          "chapter id: ${dataModel.relationships?.chapters!.data.list.first.id}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Book>>());
    });

    test("data books relationships all", () async {
      final response = await Network.methodGet(
        api: Api.apiBook,
      );
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      final getData = data.map((e) => e as Map<String, dynamic>);
      final dataModel = Data<Book>.fromJson(getData.first);
      debugPrint(
          "chapter id: ${dataModel.relationships?.chapters!.data.list.first.id}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Book>>());
    });

    test("data character", () async {
      final response = await Network.methodGet(
          api: Api.apiCharacter, id: "5e97c6a0-e000-4fb9-8d66-37cd6942d103");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Character>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.name}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Character>>());
    });

    test("data movie", () async {
      final response = await Network.methodGet(
          api: Api.apiMovie, id: "b5c93f7c-49bb-43a6-84f3-796daa75f354");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Movie>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.boxOffice}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Movie>>());
    });

    test("data potion", () async {
      final response = await Network.methodGet(
          api: Api.apiPotion, id: "84d0e169-1b55-45b3-8328-29942238e535");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Potion>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.difficulty}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Potion>>());
    });

    test("data spells", () async {
      final response = await Network.methodGet(
          api: Api.apiSpell, id: "94128c2f-4180-4daf-81b4-9b96494caa75");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Spell>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.creator}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Spell>>());
    });

    test("data", () async {
      final response = await Network.methodGet(
          api: Api.apiSpell, id: "94128c2f-4180-4daf-81b4-9b96494caa75");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Spell>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.creator}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Spell>>());
    });

    test("chapter test", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7" +
              "/chapters/fc856b8e-bbf2-45c4-af24-00c7ba7b5978");
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final dataModel = Data<Chapter>.fromJson(data as Map<String, dynamic>);
      debugPrint("name: ${dataModel.attributes.slug}");
      debugPrint("id: ${dataModel.id}");
      expect(dataModel, const TypeMatcher<Data<Chapter>>());
    });
  });
}
