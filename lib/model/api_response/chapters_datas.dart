import 'chapters_atributes.dart';

class ChaptersData {
  List<ChaptersAttributes> list;
  ChaptersData({required this.list});

  factory ChaptersData.fromJson(List<Map<String, dynamic>> json) {
    final datas = json.map((e) {
      final data = ChaptersAttributes.fromJson(e);
      return data;
    }).toList();
    return ChaptersData(list: datas);
  }
}
