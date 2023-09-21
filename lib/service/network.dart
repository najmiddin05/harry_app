import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harry_app/model/api_response/api_response_all.dart';
import 'package:harry_app/model/api_response/api_response_for_all_of_them.dart';
import 'package:harry_app/model/api_response/api_response_one.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/service/apis.dart';
import 'package:http/http.dart';

import '../model/book.dart';

class Network {
  static Future<String?> methodGet({
    required String api,
    String baseUrl = Api.baseUrl,
    String? id,
  }) async {
    Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
    final response = await get(url);
    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  static AllResponse parseAllOfThem(String data) {
    final json = jsonDecode(data);
    final apiResponse = AllResponse.fromJson(json);
    return apiResponse;
  }

  static ApiResponseAll parseCharacterAll(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseAll<Character>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseOne parseCharacterOne(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseOne<Character>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseAll parseBookAll(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseAll<Book>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseOne parseBookOne(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseOne<Book>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseAll parseMovieAll(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseAll<Movie>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseOne parseMovieOne(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseOne<Movie>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseAll parsePotionAll(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseAll<Potion>.fromJson(json);
    return apiResponse;
  }

  static ApiResponseOne parsePotionOne(String data) {
    final json = jsonDecode(data);
    final apiResponse = ApiResponseOne<Potion>.fromJson(json);
    return apiResponse;
  }
}
