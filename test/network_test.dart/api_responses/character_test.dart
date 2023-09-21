import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Character test", () {
    test("get one character", () async {
      final response = await Network.methodGet(
          api: Api.apiCharacter, id: "5e97c6a0-e000-4fb9-8d66-37cd6942d103");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final character = Character.fromJson(getAttributes);
      expect(character, const TypeMatcher<Character>());
    });
  });

  test("get all character", () async {
    List<Character> list;
    final response = await Network.methodGet(api: Api.apiCharacter);
    final json = jsonDecode(response!);
    final data = json["data"] as List;
    list = data.map((element) {
      final item = element as Map;
      final attributes = item["attributes"] as Map;
      return Character.fromJson(attributes as Map<String, dynamic>);
    }).toList();
    expect(list, hasLength(data.length));
  });
}
