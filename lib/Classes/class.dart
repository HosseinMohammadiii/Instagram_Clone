import 'package:flutter/material.dart';

//Widget Use the Texts
Widget textInfo(
  String txt,
  dynamic clr,
  double size,
  String ftm,
) {
  return Container(
    child: Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: clr,
        fontSize: size,
        fontFamily: ftm,
      ),
    ),
  );
}

//Widget Use the button
Widget buttonClick(
  String txt,
  dynamic clr,
  double sizew,
  double sizeh,
  double sizet,
  double radius,
  String ftm,
  dynamic clrt,
) {
  return Container(
    width: sizew,
    height: sizeh,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: textInfo(txt, clrt, sizet, ftm),
  );
}

//Widget SizedBox
Widget sizedBox(
  double width,
  double height,
) {
  return SizedBox(
    width: width,
    height: height,
  );
}
