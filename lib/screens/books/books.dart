import 'package:flutter/material.dart';

import '../../model/book.dart';
import '../../model/data.dart';
import '../../service/apis.dart';
import '../../service/network.dart';
import '../../views/container_row.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with AutomaticKeepAliveClientMixin {
  List<Data> listBook = [];
  void fetchDataBook() async {
    final data = await Network.methodGet(api: Api.apiBook);
    listBook = Network.parseBookAll(data!).datas.list;
    // debugPrint(list.length.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchDataBook();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView.builder(
        // itemCount: colorsList.length,
        itemCount: listBook.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          final book = listBook[i];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 230,
              width: MediaQuery.sizeOf(context).width + 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ContainerWidgetForOne(
                  book: book,
                  assetImage: (book.attributes as Book).cover.toString(),
                  heading: (book.attributes as Book).title.toString(),
                  author: (book.attributes as Book).author.toString(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
