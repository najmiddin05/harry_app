import '../data.dart';
import '../datas.dart';
import '../links.dart';
import '../meta.dart';

/// R: book, movie, potion, spell, character
/// T: Datas(List) or Data(Map)
///

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
      data = Datas<R>.fromJson((json["data"] as List<dynamic>).map((e) {
        final item = e as Map<String, dynamic>;
        return item;
      }).toList()) as T;
    }
    final meta = Meta.fromJson(json['meta'] as Map<String, dynamic>);
    final links = Links.fromJson(json['links'] as Map<String, dynamic>);
    return ApiResponse<T, R>(data: data, meta: meta, links: links);
  }
}
