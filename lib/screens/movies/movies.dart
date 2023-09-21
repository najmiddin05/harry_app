import 'package:flutter/material.dart';
import 'package:harry_app/model/movie.dart';

import '../../model/data.dart';
import '../../service/apis.dart';
import '../../service/constants/colors.dart';
import '../../service/constants/fonts.dart';
import '../../service/constants/icons.dart';
import '../../service/network.dart';
import 'detail_page_three.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with AutomaticKeepAliveClientMixin {
  List<Data> listMovie = [];
  void fetchDataBook() async {
    final data = await Network.methodGet(api: Api.apiMovie);
    listMovie = Network.parseMovieAll(data!).datas.list;
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).width,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMovie.length,
              itemBuilder: (context, index) {
                final movie = listMovie[index];
                return MoviesContainer(
                  // data: movie,
                  image: (movie.attributes as Movie).poster.toString(),
                  // colorsList: colorsList[index],
                  colorsList: Colors.black,
                  description:
                      (movie.attributes as Movie).title!.split(" ").first,
                  heading: (movie.attributes as Movie).title ?? '',
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Now Plaing",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "See all >",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 310,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMovie.length,
              itemBuilder: (context, index) {
                final movie = listMovie[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: MoviesWidget(
                    data: movie,
                    image: (movie.attributes as Movie).poster.toString(),
                    colorsList: Colors.transparent,
                    heading: (movie.attributes as Movie).title ?? '',
                    minutes: (movie.attributes as Movie).runningTime,
                    pG1: (movie.attributes as Movie).rating,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({
    super.key,
    required this.colorsList,
    required this.description,
    required this.heading,
    required this.image,
    // required this.data
  });
  // final Data data;
  final Color colorsList;
  final String heading;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.sizeOf(context).width,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: colorsList,
          ),
          child: Image(
            image: NetworkImage(image),
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                fit: BoxFit.cover,
                // image: AssetImage(
                //     "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png"),
                image: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/data-and-network-7/135/57-512.png"),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 1.4,
                    child: Text(
                      heading,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: IconButton(
                    onPressed: () {}, // ❌
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MoviesWidget extends StatelessWidget {
  const MoviesWidget(
      {super.key,
      required this.colorsList,
      required this.heading,
      required this.minutes,
      required this.pG1,
      required this.image,
      required this.data});
  final String heading;
  final Color colorsList;
  final String minutes;
  final String pG1;
  final String image;
  final Data data;
  void goToDetail(BuildContext context, String id) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailThirdPage(id: id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 310,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 170,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: colorsList,
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(image: NetworkImage(image.toString())),
            ),
            child: Image(
              image: NetworkImage(image),
              errorBuilder: (context, error, stackTrace) {
                return const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              // "Harry Potter and the Deathly Hallows – Part 2",
              heading,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  // "146 minutes",
                  minutes.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                //  onPressed: () => goToDetail(
                //                   context,
                //                   (data.attributes as Character)
                //                       .slug
                //                       .toString(),
                //                 ),
                onTap: () => goToDetail(
                    context, (data.attributes as Movie).slug.toString()),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
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
                                image: CustomIcons.star, fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            pG1,
                            style: textStyleForInterW600(
                                fontSize: 10, color: CustomColors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
