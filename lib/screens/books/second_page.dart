import 'dart:math';
import 'package:flutter/material.dart';
import '../../service/constants/colors.dart';
import '../../service/constants/fonts.dart';
import '../../service/constants/strings.dart';

class SecondPage extends StatefulWidget {
  final String data1;

  const SecondPage({super.key, required this.data1});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // final ApiResponseOne parseOne = Network.parseBookOne( widget.data1);
    // final book = (parseOne.data.attributes) as Book;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          Strings.chapterOne,
          style: TextStyle(
              fontFamily: Fonts.playfairDisplay,
              color: CustomColors.black,
              fontSize: 28,
              decoration: TextDecoration.underline),
        ),
      ),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox.expand(
            child: Column(
              children: [
                // const Spacer(
                //   flex: 6,
                // ),

                // const Spacer(
                //   flex: 2,
                // ),
                const Spacer(
                  flex: 1,
                ),
                // Container(
                //   width: MediaQuery.sizeOf(context).width,
                //   height: MediaQuery.sizeOf(context).height / 3.4,
                //   decoration: BoxDecoration(
                //       border:
                //           Border.all(width: 0.75, color: CustomColors.black)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Text(
                //           textAlign: TextAlign.center,
                //           Strings.theInfectionComes1,
                //           style: textStyleForInterW400(
                //               fontSize: 16, color: CustomColors.black),
                //         ),
                //         Text(
                //           textAlign: TextAlign.center,
                //           Strings.ifTheBlood,
                //           style: textStyleForInterW400(
                //               fontSize: 16, color: CustomColors.black),
                //         ),
                //         Text(
                //           textAlign: TextAlign.center,
                //           Strings.theInfectionComes2,
                //           style: textStyleForInterW400(
                //               fontSize: 16, color: CustomColors.black),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // const Spacer(
                //   flex: 3,
                // ),
                SizedBox(
                  child: DropCapText(
                    dropCap: widget.data1[0],
                    dropCapStyle: const TextStyle(
                      fontSize: 95.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 0.9,
                    ),
                    text: widget.data1.substring(1),
                    textStyle: const TextStyle(
                      fontSize: 21.0,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 7,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropCapText extends StatelessWidget {
  final String dropCap;
  final TextStyle dropCapStyle;
  final String text;
  final TextStyle textStyle;
  final EdgeInsets dropCapPadding;

  const DropCapText(
      {super.key,
      required this.dropCap,
      required this.dropCapStyle,
      required this.text,
      required this.textStyle,
      this.dropCapPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //get the drop cap size
        final dropCapSpan = TextSpan(
          text: dropCap,
          style: dropCapStyle,
        );
        final dropCapPainter = TextPainter(
            text: dropCapSpan, textDirection: Directionality.of(context));
        dropCapPainter.layout(maxWidth: constraints.maxWidth);

        // final ordinarySize = Size(0, 5);
        final dropCapSize = dropCapPainter.size;

        debugPrint("${dropCapPainter.size}");
        debugPrint(" constraints.maxWidth: ${constraints.maxWidth}");

        //get the position of the last bit of text next to the dropcap
        final textSpan = TextSpan(text: text, style: textStyle);
        final textPainter = TextPainter(
            text: textSpan, textDirection: Directionality.of(context));
        textPainter.layout(
          maxWidth: max(
            constraints.minWidth,
            constraints.maxWidth -
                dropCapPadding.horizontal -
                dropCapSize.width,
          ),
        );
        debugPrint("maxWidth: ${max(
          constraints.minWidth,
          constraints.maxWidth - dropCapPadding.horizontal - dropCapSize.width,
        )}");
        final lastPosition = textPainter.getPositionForOffset(
          Offset(textPainter.width,
              dropCapSize.height + dropCapPadding.vertical - 30), // ✅
        );
        debugPrint("lastPosition:$lastPosition");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 200,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: dropCapPadding,
                  child: Text(
                    dropCap,
                    style: dropCapStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    text.substring(0, lastPosition.offset),
                    style: textStyle,
                    softWrap: true,
                    // maxLines: 3,
                  ),
                ),
              ],
            ),
            Text(text.substring(lastPosition.offset), style: textStyle),
          ],
        );
      },
    );
  }
}


// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() => runApp(MaterialApp(title: 'Demo', home: MyApp()));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 child: const DropCapText(
//                   dropCap: "L",
//                   dropCapStyle: TextStyle(
//                       fontSize: 110.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       height: 1),
//                   text:
//                       "orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//                   textStyle: TextStyle(
//                     fontSize: 26.0,
//                     // fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }
