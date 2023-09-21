import 'chapters_datas.dart';

class ChaptersMap {
  ChaptersData data;
  ChaptersMap({
    required this.data,
  });
  factory ChaptersMap.fromJson(Map<String, Object?> json) {
    return ChaptersMap(
      data: ChaptersData.fromJson((json["data"] as List<dynamic>).map((e) {
        final item = e as Map<String, dynamic>;
        return item;
      }).toList()),
    );
  }
}
