import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harry_app/model/character.dart';
import 'package:harry_app/service/apis.dart';
import '../../model/book.dart';
import '../../model/data.dart';
import '../../service/network.dart';
import '../../views/container_row.dart';
import '../../views/container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<Data> list = [];
  void fetchDataCharacter() async {
    final data = await Network.methodGet(api: Api.apiCharacter);
    list = Network.parseCharacterAll(data!).datas.list;
    debugPrint(list.toString());
    setState(() {});
  }

  List<Data> listBook = [];
  void fetchDataBook() async {
    final data = await Network.methodGet(api: Api.apiBook);
    listBook = Network.parseBookAll(data!).datas.list;
    debugPrint(list.length.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchDataCharacter();
    fetchDataBook();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // backgroundColor: Colors.white54,
      appBar: AppBar(
        // backgroundColor: Colors.white60,
        title: const Text(
          "About actors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 230,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    // itemCount: colorsList.length,
                    itemCount: listBook.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final book = listBook[i];
                      return SizedBox(
                        height: 230,
                        width: MediaQuery.sizeOf(context).width + 17,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ContainerWidgetForOne(
                            book: book,
                            assetImage:
                                (book.attributes as Book).cover.toString(),
                            heading: (book.attributes as Book).title.toString(),
                            author: (book.attributes as Book).author.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Text(
                "Characters",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 397,
                width: MediaQuery.sizeOf(context).width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    // childAspectRatio: 2 / 3,
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.sizeOf(context).height / 2.78,
                  ),
                  itemBuilder: (context, index) {
                    final character = list[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ContainerForColumn(
                        data: character,
                        assetImage: (character.attributes as Character)
                            .image
                            .toString(),
                        name:
                            (character.attributes as Character).name.toString(),
                        realName: (character.attributes as Character)
                            .species
                            .toString(),
                        patronus: (character.attributes as Character)
                            .gender
                            .toString(),
                        backGroundColor: CupertinoColors.black,
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
