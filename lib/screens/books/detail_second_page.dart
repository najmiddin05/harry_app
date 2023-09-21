import 'package:flutter/material.dart';
import '../../service/apis.dart';
import '../../service/network.dart';
import '../home_page/error_page.dart';
import 'first_page.dart';
import '../home_page/loading_page.dart';

class DetailPageSecond extends StatelessWidget {
  final String id;
  const DetailPageSecond({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Network.methodGet(api: Api.apiBook, id: id),
      initialData: "No data",
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const ErrorPage(message: "No Data");
          case ConnectionState.waiting:
            return const LoadingPage();
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return FirstPage(data1: snapshot.data!);
            } else {
              return const ErrorPage(
                  message:
                      "Something error, Please check your internet connecting!");
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}
