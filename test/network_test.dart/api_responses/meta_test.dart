import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/meta.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("meta test", () {
    test("meta get", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final book = Meta.fromJson(meta as Map<String, dynamic>);
      expect(book, const TypeMatcher<Meta>());
    });
  });
}
