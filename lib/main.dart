import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_reader/constants/constants.dart';
import 'package:pdf_reader/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
        title: "PDF READER",
        theme: ThemeData(
            fontFamily: "Poppins",
            scaffoldBackgroundColor: bgColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white, elevation: 0)));
  }
}
