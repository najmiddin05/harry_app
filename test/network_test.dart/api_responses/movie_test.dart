import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Movie test", () {
    test("get one movie", () async {
      final response = await Network.methodGet(
          api: Api.apiMovie, id: "b5c93f7c-49bb-43a6-84f3-796daa75f354");
      debugPrint(response);
      final json = jsonDecode(response!);
      final data = json["data"];
      final getData = data as Map<String, dynamic>;
      final attributes = getData["attributes"] as Map;
      final getAttributes = attributes as Map<String, dynamic>;
      final book = Movie.fromJson(getAttributes);
      expect(book, const TypeMatcher<Movie>());
    });
  });

  test("get all movie", () async {
    List<Movie> movie;
    final response = await Network.methodGet(api: Api.apiMovie);
    debugPrint(response);
    final json = jsonDecode(response!);
    final data = json["data"] as List;
    movie = data.map((element) {
      final item = element as Map;
      final attributes = item["attributes"] as Map;
      return Movie.fromJson(attributes as Map<String, dynamic>);
    }).toList();
    expect(movie, hasLength(data.length));
  });
}
