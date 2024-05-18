import 'package:flutter/material.dart';
import 'package:flutter_instagram_project/Screens/login_screen.dart';

void main() async {
  await Future.delayed(Duration(seconds: 4));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
        );
      },
      home: loginScreen(),
    ),
  );
}
