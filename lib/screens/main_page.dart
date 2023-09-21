import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harry_app/model/data.dart';
import 'package:harry_app/model/potion.dart';
import 'package:harry_app/screens/books/books.dart';
import 'package:harry_app/screens/movies/movies.dart';
import 'package:harry_app/service/apis.dart';
import 'package:harry_app/service/constants/colors.dart';
import 'package:harry_app/service/network.dart';

import 'home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        scrollBehavior: const CupertinoScrollBehavior(),
        controller: controller,
        scrollDirection: Axis.horizontal,
        reverse: false,
        onPageChanged: (page) {
          currentIndex = page;
          setState(() {});
        },
        children: const [
          HomePage(),
          BookPage(),
          MoviePage(),
          PotionPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        elevation: 0,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.white,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                onPressed: () {
                  currentIndex = 0;
                  controller.jumpToPage(0);
                  setState(() {});
                },
                icon: Icon(
                  CupertinoIcons.home,
                  color:
                      currentIndex == 0 ? Colors.black : Colors.grey.shade700,
                  size: currentIndex == 0 ? 30 : null,
                ),
              ),
            ),
            Material(
              color: Colors.white,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                  onPressed: () {
                    currentIndex = 1;
                    controller.jumpToPage(1);
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.bookmark,
                    color:
                        currentIndex == 1 ? Colors.black : Colors.grey.shade700,
                    size: currentIndex == 1 ? 30 : null,
                  )),
            ),
            Material(
              color: Colors.white,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                  onPressed: () {
                    currentIndex = 2;
                    controller.jumpToPage(2);
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.play_rectangle,
                    color:
                        currentIndex == 2 ? Colors.black : Colors.grey.shade700,
                    size: currentIndex == 2 ? 30 : null,
                  )),
            ),
            Material(
              color: Colors.white,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                  onPressed: () {
                    currentIndex = 3;
                    controller.jumpToPage(3);
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.settings_solid,
                    color:
                        currentIndex == 3 ? Colors.black : Colors.grey.shade700,
                    size: currentIndex == 3 ? 30 : null,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class PotionPage extends StatefulWidget {
  const PotionPage({super.key});

  @override
  State<PotionPage> createState() => _PotionPageState();
}

class _PotionPageState extends State<PotionPage> {
  List<Data> listPotion = [];
  void fetchDataBook() async {
    final data = await Network.methodGet(api: Api.apiPotion);
    listPotion = Network.parsePotionAll(data!).datas.list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchDataBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potion'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listPotion.length,
          itemBuilder: (context, index) {
            final potion = listPotion[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                    color: CustomColors.black,
                    width: 1,
                  )),
              child: ListTile(
                title: Text((potion.attributes as Potion).name),
                subtitle:
                    Text((potion.attributes as Potion).effect ?? 'No Effect'),
                leading: Image(
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Image(
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png"));
                  },
                  image: NetworkImage(
                    (potion.attributes as Potion).image.toString(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
