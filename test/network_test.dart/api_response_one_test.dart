import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/api_response_one.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("apiResponse test", () {
    test("apiResponse", () async {
      final response = await Network.methodGet(
          api: Api.apiBook, id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      final json = jsonDecode(response!);
      final apiResponse = ApiResponseOne<Book>.fromJson(json);
      debugPrint("id: ${apiResponse.data.attributes.author}");
      debugPrint(apiResponse.meta.copyright.toString());
      expect(apiResponse, const TypeMatcher<ApiResponseOne<Book>>());
    });
  });
}
