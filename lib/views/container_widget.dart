import 'package:flutter/material.dart';
import 'package:harry_app/model/character.dart';

import '../model/data.dart';
import '../screens/home_page/detail_page.dart';

class ContainerForColumn extends StatelessWidget {
  final Data data;
  final String assetImage;
  final String name;
  final String realName;
  final String patronus;

  const ContainerForColumn({
    required this.data,
    super.key,
    required this.assetImage,
    required this.name,
    required this.realName,
    required this.patronus,
    required Color backGroundColor,
  });

  void goToDetail(BuildContext context, String id) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailPage(id: id),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.black,
            width: 0.75,
          ),
        ),
        height: MediaQuery.sizeOf(context).height / 2.78, //265// 3.5
        width: MediaQuery.sizeOf(context).width / 2.6, //165//2.6

        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                boxShadow: [
                  const BoxShadow(
                    color: Color(0xffffffff),
                    offset: Offset(-10, -10),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.1),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.black, width: 0.75),
              ),

              height: MediaQuery.sizeOf(context).height / 4.9, //155//6
              width: MediaQuery.sizeOf(context).width, //165//2.6

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: (data.attributes as Character).image == null
                    ? const Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png"))
                    : Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            (data.attributes as Character).image.toString()),
                        errorBuilder: (context, error, stackTrace) {
                          return const Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/Screenshot 2023-07-12 at 04.02.42 copy.png"));
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // ignore: unnecessary_null_comparison
                    (data.attributes as Character).name != null
                        ? name
                        : "No Name",
                    // ignore: unnecessary_null_comparison
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (data.attributes as Character).species != null
                        ? realName
                        : "No data",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (data.attributes as Character).gender != null
                            ? patronus
                            : "No data",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.black)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 30,
                            onPressed: () => goToDetail(
                                  context,
                                  (data.attributes as Character)
                                      .slug
                                      .toString(),
                                ),
                            icon: const Icon(Icons.arrow_right_alt_outlined)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:harry_app/model/character.dart';
// import 'package:harry_app/model/data.dart';


// class ContainerForColumn extends StatelessWidget {
//   final Data character;
//   final String assetImage;
//   final String name;
//   final String realName;
//   final String patronus;

//   const ContainerForColumn({
//     required this.character,
//     super.key,
//     required this.assetImage,
//     required this.name,
//     required this.realName,
//     required this.patronus,
//   });

//   void goToDetail(BuildContext context, String id) {
//     // Navigator.of(context).push(MaterialPageRoute(
//     //   builder: (context) => DetailPage(id: id),
//     // ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.all(Radius.circular(15)),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey,
//           borderRadius: const BorderRadius.all(Radius.circular(15)),
//           border: Border.all(
//             color: Colors.black,
//             width: 0.75,
//           ),
//         ),
//         height: MediaQuery.sizeOf(context).height / 2.78, //265// 3.5
//         width: MediaQuery.sizeOf(context).width / 2.6, //165//2.6

//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.sizeOf(context).height / 4.9, //155//6
//               width: MediaQuery.sizeOf(context).width, //165//2.6
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(15)),
//                 color: Colors.grey[400],
//                 border: Border.all(color: Colors.black, width: 0.75),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image(
//                   image: NetworkImage(
//                    (character.attributes as Character).image != ""
//                         ? (character.attributes as Character).image.toString()
//                         : (character.gender == "male"
//                             ? "https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg"
//                             : "https://t3.ftcdn.net/jpg/02/33/46/24/360_F_233462402_Fx1yke4ng4GA8TJikJZoiATrkncvW6Ib.jpg"),
//                   )
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     realName,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         patronus,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 1, color: Colors.black)),
//                         // child: IconButton(
//                         //     padding: EdgeInsets.zero,
//                         //     splashRadius: 30,
//                         //     // onPressed: () => goToDetail(context, character.),
//                         //     icon: const Icon(Icons.arrow_right_alt_outlined)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
