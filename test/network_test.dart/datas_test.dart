import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/model/chapter/chapter.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/model/datas.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/model/spell.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("Datas", () {
    test("get all datas", () async {
      final response = await Network.methodGet(api: Api.apiBook);
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Book> books = Datas.fromJson(datas);
      debugPrint(datas.toString());
      expect(
        books,
        const TypeMatcher<Datas<Book>>(),
      );
    });

    test("get all character", () async {
      final response = await Network.methodGet(api: Api.apiCharacter);
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Character> books = Datas.fromJson(datas);
      debugPrint(datas.toString());
      expect(
        books,
        const TypeMatcher<Datas<Character>>(),
      );
    });

    test("get all movies", () async {
      final response = await Network.methodGet(api: Api.apiMovie);
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Movie> books = Datas.fromJson(datas);
      debugPrint(datas.toString());
      expect(
        books,
        const TypeMatcher<Datas<Movie>>(),
      );
    });

    test("get all potion", () async {
      final response = await Network.methodGet(api: Api.apiPotion);
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Potion> books = Datas.fromJson(datas);
      debugPrint(datas.toString());
      expect(
        books,
        const TypeMatcher<Datas<Potion>>(),
      );
    });

    test("get all spells", () async {
      final response = await Network.methodGet(api: Api.apiSpell);
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Spell> books = Datas.fromJson(datas);
      debugPrint(datas.toString());
      expect(
        books,
        const TypeMatcher<Datas<Spell>>(),
      );
    });

    test("get all chapters", () async {
      final response = await Network.methodGet(
          api: Api.apiBook,
          id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7" + "/chapters");
      debugPrint(response);
      final json = jsonDecode(response!);
      final datas = (json["data"] as List).map((e) => e as Map).toList();
      final chapters = Datas<Chapter>.fromJson(datas);
      expect(
        chapters,
        const TypeMatcher<Datas<Chapter>>(),
      );
    });
  });
}
