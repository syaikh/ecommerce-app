import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
            255,
            251,
            48,
            82,
          ),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(
          249,
          249,
          249,
          1,
        ),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
