import 'package:flutter/material.dart';
import 'package:keydata_zipcikti/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      color: Colors.white,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          outlinedButtonTheme: const OutlinedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(300),
                        right: Radius.circular(300),
                      ),
                      side: BorderSide(
                        color: Colors.red,
                      )))))),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    ),
  );
}
