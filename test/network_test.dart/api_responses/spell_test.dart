import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/spell.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Spell test", () {
    test("get one spell", () async {
      final response = await Network.methodGet(
          api: Api.apiSpell, id: "05550cc0-2ebf-41d3-a74d-f4b4b84dd2a0");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final book = Spell.fromJson(getAttributes);
      expect(book, const TypeMatcher<Spell>());
    });

    test("get all spell", () async {
      List<Spell> list;
      final response = await Network.methodGet(api: Api.apiSpell);
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      list = data.map((element) {
        final item = element as Map;
        final attributes = item["attributes"] as Map;
        return Spell.fromJson(attributes as Map<String, dynamic>);
      }).toList();
      expect(list, hasLength(data.length));
    });
  });
}
