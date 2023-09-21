import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Potion test", () {
    test("get one potion", () async {
      final response = await Network.methodGet(
          api: Api.apiPotion, id: "84d0e169-1b55-45b3-8328-29942238e535");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final book = Potion.fromJson(getAttributes);
      expect(book, const TypeMatcher<Potion>());
    });

    test("get all book", () async {
      List<Potion> potion;
      final response = await Network.methodGet(api: Api.apiPotion);
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      potion = data.map((element) {
        final item = element as Map;
        final attributes = item["attributes"] as Map;
        return Potion.fromJson(attributes as Map<String, dynamic>);
      }).toList();
      expect(potion, hasLength(data.length));
    });
  });
}
