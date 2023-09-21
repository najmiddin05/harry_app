import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/links.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("links test", () {
    test("links get", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      final json = jsonDecode(response!);
      final links = json["links"] as Map;
      final book = Links.fromJson(links as Map<String, dynamic>);
      expect(book, const TypeMatcher<Links>());
    });
  });
}
