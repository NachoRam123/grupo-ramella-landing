import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grupo_ramella_landing/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo Ramella',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 15, 74, 71),
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 243, 238),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 15, 74, 71),
          primary: const Color.fromARGB(255, 15, 74, 71),
          secondary: const Color.fromARGB(255, 107, 191, 89),
          surface: const Color.fromARGB(255, 247, 243, 238),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const LandingPage(),
    );
  }
}
