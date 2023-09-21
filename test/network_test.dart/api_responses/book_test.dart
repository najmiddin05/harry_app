import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Book test", () {
    test("get one book", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "8c3ac302-010a-4219-9483-2273a7fc6d20");
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final book = Book.fromJson(getAttributes);
      debugPrint(book.cover);
      expect(book, const TypeMatcher<Book>());
    });

    test("get all book", () async {
      List<Book> book;
      final response = await Network.methodGet(api: Api.apiBook);
      // debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      book = data.map((element) {
        final item = element as Map;
        final attributes = item["attributes"] as Map;
        return Book.fromJson(attributes as Map<String, dynamic>);
      }).toList();
      debugPrint(book.first.cover);
      expect(book, hasLength(data.length));
    });
  });
}
