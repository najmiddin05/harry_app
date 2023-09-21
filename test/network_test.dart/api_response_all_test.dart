import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_app/model/api_response/api_response_all.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/network.dart';

void main() {
  group("apiResponse test", () {
    test(
      "apiResponse",
      () async {
        final response = await Network.methodGet(api: Api.apiBook);
        debugPrint(response);
        final json = jsonDecode(response!);
        final apiResponse = ApiResponseAll<Book>.fromJson(json);
        debugPrint("id: ${apiResponse.datas.list.first.id}");
        debugPrint(apiResponse.meta.pagination!.current.toString());
        expect(apiResponse, const TypeMatcher<ApiResponseAll<Book>>());
      },
    );

    test(
      "apiResponse",
      () async {
        final response = await Network.methodGet(api: Api.apiBook);
        debugPrint(response);
        final json = jsonDecode(response!);
        final apiResponse = ApiResponseAll<Book>.fromJson(json);
        debugPrint("id: ${apiResponse.datas.list.first.id}");
        debugPrint(apiResponse.meta.pagination!.current.toString());
        expect(apiResponse, const TypeMatcher<ApiResponseAll<Book>>());
      },
    );
  });
}
