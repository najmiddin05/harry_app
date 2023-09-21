import 'package:harry_app/model/data.dart';

class Datas<T> {
  List<Data<T>> list;
  Datas({required this.list});

  factory Datas.fromJson(List<dynamic> json) {
    final datas = json.map((e) {
      final item = e as Map<String, dynamic>;
      final data = Data<T>.fromJson(item);
      return data;
    }).toList();
    return Datas(list: datas);
  }
}
