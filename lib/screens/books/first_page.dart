import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:harry_app/screens/books/second_page.dart';

import '../../model/api_response/api_response_one.dart';
import '../../model/book.dart';
import '../../service/constants/colors.dart';
import '../../service/constants/fonts.dart';
import '../../service/constants/icons.dart';
import '../../service/constants/image.dart';
import '../../service/constants/strings.dart';
import '../../service/network.dart';
import '../../views/elevetedButton.dart';

class FirstPage extends StatelessWidget {
  final String data1;
  const FirstPage({super.key, required this.data1});

  @override
  Widget build(BuildContext context) {
    final ApiResponseOne parseOne = Network.parseBookOne(data1);
    final book = (parseOne.data.attributes) as Book;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 1.9,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: CustomImages.image9, fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 6,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1, color: CustomColors.black)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashRadius: 20,
                          onPressed: () => Navigator.pop(
                            context,
                            // MaterialPageRoute(
                            //   builder: (context) => const HomeScreen(),
                            // ),
                          ),
                          icon: const Icon(
                            Icons.arrow_forward_rounded,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width / 1.5,
                            height: 70,
                            child: Text(
                              book.title.toString(),
                              // attributesBook.title.toString(),
                              style: textStyleForPlayfairDisplay(
                                  fontSize: 17, color: CustomColors.black),
                            ),
                          ),
                          Text(
                            book.author.toString(),
                            style: textStyleForInterW400(
                                fontSize: 14, color: CustomColors.grey68),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 3.7,
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(book.cover.toString()))),
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(0, 35),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 1.5,
                      height: MediaQuery.sizeOf(context).height / 14,
                      decoration: const BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: CustomColors.yellowE0,
                              borderRadius: BorderRadius.all(
                                Radius.circular(11),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: CustomIcons.star,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    book.order.toString(),
                                    style: textStyleForInterW600(
                                        fontSize: 14,
                                        color: CustomColors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: CustomColors.blueFB,
                              borderRadius: BorderRadius.all(
                                Radius.circular(11),
                              ),
                            ),
                            child: Text(
                              Strings.fantasy,
                              style: textStyleForInterW500(
                                  fontSize: 12, color: CustomColors.black),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: textStyleForInterW600(
                                fontSize: 12,
                                color: CustomColors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: book.pages.toString(),
                                ),
                                TextSpan(
                                  text: Strings.pages2,
                                  style: textStyleForInterW400(
                                      fontSize: 12, color: CustomColors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 3.3,
                child: ListView(
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        book.title.toString(),
                        style: textStyleForPlayfairDisplay(
                            fontSize: 20, color: CustomColors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      book.summary.toString(),
                      style: textStyleForInterW400(
                        height: 1.8,
                        fontSize: 13,
                        color: CustomColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      Strings.butNothingComes,
                      style: textStyleForInterW400(
                        height: 1.8,
                        fontSize: 13,
                        color: CustomColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      Strings.togetherTheyMust,
                      style: textStyleForInterW400(
                        height: 1.8,
                        fontSize: 13,
                        color: CustomColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: CustomColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffffffff).withOpacity(0.1),
                      offset: const Offset(-10, -10),
                      blurRadius: 20,
                    ),
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.3),
                      offset: const Offset(10, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondPage(data1: book.summary.toString()),
                    ),
                  ),
                  icon: const Image(
                    image: CustomIcons.archive,
                    color: CustomColors.pink8A,
                  ),
                ),
              ),
              const ElevetedButtonForUsing1(
                title: Strings.buyNow,
                textColor: CustomColors.white,
                backGoundColor: CustomColors.blueGrey66,
              )
            ],
          ),
        ));
  }
}
