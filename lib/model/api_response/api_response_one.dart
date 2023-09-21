import '../data.dart';
import '../links.dart';
import '../meta.dart';

class ApiResponseOne<T> {
  Data<T> data;
  Meta meta;
  Links links;
  ApiResponseOne({
    required this.data,
    required this.meta,
    required this.links,
  });
  factory ApiResponseOne.fromJson(Map<String, Object?> json) {
    return ApiResponseOne<T>(
      data: Data<T>.fromJson(json["data"] as Map<String, dynamic>),
      meta: Meta.fromJson(json["meta"] as Map<String, dynamic>),
      links: Links.fromJson(json["links"] as Map<String, dynamic>),
    );
  }
}
