import 'package:flutter/material.dart';
import 'package:harry_app/model/book.dart';
import 'package:harry_app/model/data.dart';

import '../screens/books/detail_second_page.dart';
import 'elevetedButton.dart';

class ContainerWidget extends StatelessWidget {
  final AssetImage assetImage;
  final Color backGoundColor;
  final String heading;
  final String author;

  const ContainerWidget({
    super.key,
    required this.assetImage,
    required this.backGoundColor,
    required this.heading,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height / 4.1,
      width: MediaQuery.of(context).size.width / 1,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: backGoundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(image: assetImage),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(heading,
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                Text(author,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey)
                    // textStyleForInterW500(
                    //   fontSize: 18,
                    //   color: CustomColors.grey51,
                    // ),
                    ),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      clipBehavior: Clip.antiAlias,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "30%",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  // textStyleForInterW400(
                  //     fontSize: 12, color: CustomColors.black),
                ),
                const ElevetedButtonForUsing(
                  title: "Update Progress",
                  borderColor: Color(0xff404066),
                  textColor: Color(0xff404066),
                  backGoundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWidgetForOne extends StatelessWidget {
  final Data book;
  final String assetImage;
  // final Color backGoundColor;
  final String heading;
  final String author;

  const ContainerWidgetForOne({
    //✅
    required this.book,
    super.key,
    required this.assetImage,
    required this.heading,
    required this.author,
  });

  void goToDetail(BuildContext context, String id) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailPageSecond(id: id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 4.1,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width / 3.2,
            decoration: const BoxDecoration(
              // color: backGoundColor,
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(assetImage)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 260,
                  child: Text(
                    heading,
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                    //  textStyleForPlayfairDisplay(
                    //   fontSize: 17,
                    //   color: CustomColors.black,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  author,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18),
                  // textStyleForInterW500(
                  //   fontSize: 18,
                  //   color: CustomColors.grey51,
                  // ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      clipBehavior: Clip.antiAlias,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "30%",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  //  textStyleForInterW400(
                  //     fontSize: 12, color: CustomColors.black),
                ),
                ElevetedButtonForOne(
                  onPressed: () => goToDetail(
                    context,
                    (book.attributes as Book).slug.toString(),
                  ),
                  title: "Update Progress",
                  borderColor: const Color(0xff404066),
                  textColor: const Color(0xff404066),
                  backGoundColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
