import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Configuration des polices
final TextStyle headlineLarge = GoogleFonts.poppins(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

final TextStyle headlineMedium = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

final TextStyle bodyLarge = GoogleFonts.poppins(
  fontSize: 16,
  height: 1.5,
);

final TextStyle bodyMedium = GoogleFonts.poppins(
  fontSize: 14,
  height: 1.5,
);

// Couleurs
const Color primaryColor = Color(0xFF4285F4);
const Color secondaryColor = Color(0xFF34A853);
const Color accentColor = Color(0xFFFBBC05);
const Color errorColor = Color(0xFFEA4335);

// Dégradés
final LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryColor, secondaryColor],
);

final LinearGradient darkGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Colors.blue.shade900, Colors.purple.shade800],
);

// Durées d'animation
const Duration fastAnimation = Duration(milliseconds: 300);
const Duration mediumAnimation = Duration(milliseconds: 500);
const Duration slowAnimation = Duration(milliseconds: 800);