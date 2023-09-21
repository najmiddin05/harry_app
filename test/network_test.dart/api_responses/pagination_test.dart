import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/pagination.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Pagination test", () {
    test("pagination book", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination =
          Pagination.fromJson(meta["pagination"] as Map<String, dynamic>);
      debugPrint(pagination.last.toString());
      expect(pagination, const TypeMatcher<Pagination>());
    });
  });
}
