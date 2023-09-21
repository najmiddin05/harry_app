import 'package:harry_app/model/datas.dart';
import 'package:harry_app/model/links.dart';
import 'package:harry_app/model/meta.dart';

class ApiResponseAll<T> {
  Datas<T> datas;
  Meta meta;
  Links links;
  ApiResponseAll({
    required this.datas,
    required this.meta,
    required this.links,
  });
  factory ApiResponseAll.fromJson(Map<String, Object?> json) {
    return ApiResponseAll<T>(
      datas: Datas<T>.fromJson((json["data"] as List<dynamic>).map((e) {
        final item = e as Map<String, dynamic>;
        return item;
      }).toList()),
      meta: Meta.fromJson(json["meta"] as Map<String, dynamic>),
      links: Links.fromJson(json["links"] as Map<String, dynamic>),
    );
  }
}
