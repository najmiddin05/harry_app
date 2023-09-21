import 'package:flutter/material.dart';

import '../service/constants/colors.dart';
import '../service/constants/fonts.dart';
import '../service/constants/strings.dart';

class ElevetedButtonForUsing extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color textColor;
  final Color backGoundColor;
  const ElevetedButtonForUsing({
    super.key,
    required this.title,
    required this.borderColor,
    required this.textColor,
    required this.backGoundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStatePropertyAll(CustomColors.grey51.withOpacity(0.5)),
          fixedSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
          backgroundColor: MaterialStatePropertyAll(
            backGoundColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              side: BorderSide(color: borderColor, width: 2),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          Strings.updateProgress,
          style: textStyleForInterW400(fontSize: 17, color: textColor),
        ),
      ),
    );
  }
}

class ElevetedButtonForOne extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color textColor;
  final Color backGoundColor;
  final Function() onPressed;
  const ElevetedButtonForOne({
    super.key,
    required this.title,
    required this.borderColor,
    required this.textColor,
    required this.backGoundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStatePropertyAll(CustomColors.grey51.withOpacity(0.5)),
          fixedSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
          backgroundColor: MaterialStatePropertyAll(
            backGoundColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              side: BorderSide(color: borderColor, width: 2),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          Strings.updateProgress,
          style: textStyleForInterW400(fontSize: 17, color: textColor),
        ),
      ),
    );
  }
}

class ElevetedButtonForUsing1 extends StatelessWidget {
  final String title;

  final Color textColor;
  final Color backGoundColor;
  const ElevetedButtonForUsing1({
    super.key,
    required this.title,
    required this.textColor,
    required this.backGoundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStatePropertyAll(CustomColors.white.withOpacity(0.2)),
          fixedSize: const MaterialStatePropertyAll(
            Size(300, 60),
          ),
          backgroundColor: MaterialStatePropertyAll(
            backGoundColor,
          ),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              side: BorderSide.none,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: textStyleForInterW400(fontSize: 17, color: textColor),
        ),
      ),
    );
  }
}
