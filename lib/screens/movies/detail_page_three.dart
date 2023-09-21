import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:harry_app/model/movie.dart';
import 'package:harry_app/screens/movies/youtube_player.dart';
import '../../model/api_response/api_response_one.dart';
import '../../service/apis.dart';
import '../../service/constants/colors.dart';
import '../../service/constants/fonts.dart';
import '../../service/constants/icons.dart';
import '../../service/constants/image.dart';
import '../../service/constants/strings.dart';
import '../../service/network.dart';
import '../../views/elevetedButton.dart';
import '../home_page/error_page.dart';
import '../home_page/loading_page.dart';

class MoviesOfDetailPage extends StatefulWidget {
  final String data1;
  const MoviesOfDetailPage({super.key, required this.data1});

  @override
  State<MoviesOfDetailPage> createState() => _MoviesOfDetailPageState();
}

class _MoviesOfDetailPageState extends State<MoviesOfDetailPage> {
  // void launchURL() async {
  //   Uri url = Uri.parse("https://www.youtube.com/watch?v=Vso5o11LuGU");
  //   if (await launchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ApiResponseOne parseOne = Network.parseMovieOne(widget.data1);
    final movie = (parseOne.data.attributes) as Movie;

    // Future<void> launchURL() async {
    //   Uri url = Uri.parse(movie.trailer);
    //   if (!await launchUrl(url)) {
    //     throw Exception('Could not launch $url');
    //   }
    // }

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
                              movie.title.toString(),
                              // attributesBook.title.toString(),
                              style: textStyleForPlayfairDisplay(
                                  fontSize: 17, color: CustomColors.black),
                            ),
                          ),
                          Text(
                            movie.directors.first.toString(),
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
                    // decoration: BoxDecoration(
                    //   // image: DecorationImage(
                    //   //   image: NetworkImage(
                    //   //     movie.poster.toString(),
                    //   //   ),
                    //   // ),
                    // ),
                    child: Image(
                      image: NetworkImage(movie.poster.toString()),
                      errorBuilder: (context, error, stackTrace) {
                        return const Image(
                          image: AssetImage(
                            "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png",
                          ),
                        );
                      },
                    ),
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
                                    movie.order.toString(),
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
                                  text: movie.runningTime.toString(),
                                ),
                                // TextSpan(
                                //   text: Strings.pages2,
                                //   style: textStyleForInterW400(
                                //       fontSize: 12, color: CustomColors.black),
                                // )
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
                        movie.title.toString(),
                        style: textStyleForPlayfairDisplay(
                            fontSize: 20, color: CustomColors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      movie.summary.toString(),
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
                  color: Colors.red,
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
                  // onPressed: () => Link(movie.trailer),
                  // onPressed: launchURL,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          YoutubePlayer1(data1: movie.trailer),
                    ),
                  ),

                  // onPressed: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         SecondPage(data1: book.summary.toString()),
                  //   ),
                  // ),
                  // icon: const Image(
                  //   image: CustomIcons.archive,
                  //   color: CustomColors.pink8A,
                  // ),
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
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

class DetailThirdPage extends StatelessWidget {
  final String id;
  const DetailThirdPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Network.methodGet(api: Api.apiMovie, id: id),
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
              return MoviesOfDetailPage(data1: snapshot.data!);
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
