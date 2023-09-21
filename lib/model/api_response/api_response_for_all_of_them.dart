import '../book.dart';
import '../character.dart';
import '../data.dart';
import '../datas.dart';
import '../links.dart';
import '../meta.dart';
import '../movie.dart';
import '../potion.dart';
import '../spell.dart';

class AllResponse {
  ApiResponse response;

  AllResponse({required this.response});

  factory AllResponse.fromJson(Map<String, Object?> json) {
    if (json['data'] is List) {
      String type = (json['data'] as List).first['type'];
      switch (type) {
        case "book":
          return AllResponse(
              response: ApiResponse<Datas<Book>, Book>.fromJson(json));
        case "character":
          return AllResponse(
              response:
                  ApiResponse<Datas<Character>, Character>.fromJson(json));
        case "movie":
          return AllResponse(
              response: ApiResponse<Datas<Movie>, Movie>.fromJson(json));
        case "potion":
          return AllResponse(
              response: ApiResponse<Datas<Potion>, Potion>.fromJson(json));
        default:
          return AllResponse(
              response: ApiResponse<Datas<Spell>, Spell>.fromJson(json));
      }
    } else {
      String type = (json['data'] as Map)['type'];
      switch (type) {
        case "book":
          return AllResponse(
              response: ApiResponse<Data<Book>, Book>.fromJson(json));
        case "character":
          return AllResponse(
              response: ApiResponse<Data<Character>, Character>.fromJson(json));
        case "movie":
          return AllResponse(
              response: ApiResponse<Data<Movie>, Movie>.fromJson(json));
        case "potion":
          return AllResponse(
              response: ApiResponse<Data<Potion>, Potion>.fromJson(json));
        default:
          return AllResponse(
              response: ApiResponse<Data<Spell>, Spell>.fromJson(json));
      }
    }
  }
}

/// static
class ApiResponse<T, R> {
  T data;
  Meta meta;
  Links links;

  ApiResponse({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory ApiResponse.fromJson(Map<String, Object?> json) {
    final T data;

    if (json['data'] is Map) {
      data = Data<R>.fromJson(json['data'] as Map<String, dynamic>) as T;
    } else {
      final listMap = (json['data'] as List).map((e) => e as Map).toList();
      data = Datas<R>.fromJson(listMap) as T;
    }
    final meta = Meta.fromJson(json['meta'] as Map<String, dynamic>);
    final links = Links.fromJson(json['links'] as Map<String, dynamic>);
    return ApiResponse<T, R>(data: data, meta: meta, links: links);
  }
}
