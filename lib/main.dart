import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SayItWell',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5),
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xFF3F51B5),
          secondary: const Color(0xFFFF9800),
          onSurface: const Color(0xFF1A1A1A),
        ),

        textTheme: GoogleFonts.merriweatherTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          displayLarge: GoogleFonts.merriweather(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          displayMedium: GoogleFonts.merriweather(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          displaySmall: GoogleFonts.merriweather(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          headlineLarge: GoogleFonts.merriweather(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          headlineMedium: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          headlineSmall: GoogleFonts.merriweather(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          titleLarge: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF1A1A1A),
          ),
          titleMedium: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          titleSmall: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),

          // Body: Work Sans (light and open, good for minimal design)
          bodyLarge: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF424242),
          ),
          bodyMedium: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF424242),
          ),
          bodySmall: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF757575),
          ),
          labelLarge: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          labelMedium: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          labelSmall: GoogleFonts.openSans(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF757575),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
