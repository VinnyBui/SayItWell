import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';

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

        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          // Headings: Manrope (clean, modern, great for entire UI)
          displayLarge: GoogleFonts.manrope(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1A1A1A),
          ),
          displayMedium: GoogleFonts.manrope(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
          displaySmall: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
          headlineLarge: GoogleFonts.manrope(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
          headlineMedium: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          headlineSmall: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          titleLarge: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          titleMedium: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          titleSmall: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),

          // Body: Work Sans (light and open, good for minimal design)
          bodyLarge: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF424242),
          ),
          bodyMedium: GoogleFonts.workSans(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF424242),
          ),
          bodySmall: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF757575),
          ),
          labelLarge: GoogleFonts.workSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          labelMedium: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1A1A),
          ),
          labelSmall: GoogleFonts.workSans(
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
