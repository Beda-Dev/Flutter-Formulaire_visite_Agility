import 'package:flutter/material.dart';

class AppColors {
  // Neutre (Gray)
  static const Color inc = Color(0xFFF8F9FB);
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF4F4F5);
  static const Color gray200 = Color(0xFFE4E4E7);
  static const Color gray300 = Color(0xFFD4D4D8);
  static const Color gray400 = Color(0xFF9E9EA7);
  static const Color gray500 = Color(0xFF71717A);
  static const Color gray600 = Color(0xFF52525B);
  static const Color gray700 = Color(0xFF3F3F46);
  static const Color gray800 = Color(0xFF27272A);
  static const Color gray900 = Color(0xFF18181B);

  // Couleurs de base (Rouge, Vert, Bleu, etc.)
  static const Color red50 = Color(0xFFFEE2E2);
  static const Color red100 = Color(0xFFFECACA);
  static const Color red200 = Color(0xFFFCA5A5);
  static const Color red300 = Color(0xFFF87171);
  static const Color red400 = Color(0xFFFB4444);
  static const Color red500 = Color(0xFFEF4444); // Couleur standard rouge
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);

  static const Color green50 = Color(0xFFECFDF5);
  static const Color green100 = Color(0xFFCCF9E1);
  static const Color green200 = Color(0xFFA7F3D0);
  static const Color green300 = Color(0xFF6EE7B7);
  static const Color green400 = Color(0xFF34D399);
  static const Color green500 = Color(0xFF10B981); // Couleur standard verte
  static const Color green600 = Color(0xFF059669);
  static const Color green700 = Color(0xFF047857);
  static const Color green800 = Color(0xFF065F46);
  static const Color green900 = Color(0xFF064E3B);

  static const Color blue50 = Color(0xFFE0F2FE);
  static const Color blue100 = Color(0xFFB8E0FE);
  static const Color blue200 = Color(0xFF7DC6FE);
  static const Color blue300 = Color(0xFF38A4FE);
  static const Color blue400 = Color(0xFF1D4ED8);
  static const Color blue500 = Color(0xFF3B82F6); // Couleur standard bleue
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);

  static const Color yellow50 = Color(0xFFFDF4A3);
  static const Color yellow100 = Color(0xFFFEF08A);
  static const Color yellow200 = Color(0xFFFDE047);
  static const Color yellow300 = Color(0xFFFACC15);
  static const Color yellow400 = Color(0xFFECBD14);
  static const Color yellow500 = Color(0xFFF59E0B); // Couleur standard jaune
  static const Color yellow600 = Color(0xFFD97706);
  static const Color yellow700 = Color(0xFFB45309);
  static const Color yellow800 = Color(0xFF92400E);
  static const Color yellow900 = Color(0xFF78350F);

  // Nouvelles couleurs ajoutées
  static const Color orange50 = Color(0xFFFFF7E6);
  static const Color orange100 = Color(0xFFFFE0B2);
  static const Color orange200 = Color(0xFFFFC107);
  static const Color orange300 = Color(0xFFFF9800);
  static const Color orange400 = Color(0xFFF57C00);
  static const Color orange500 = Color(0xFFFB8C00); // Orange standard

  static const Color purple50 = Color(0xFFF3E5F5);
  static const Color purple100 = Color(0xFFE1BEE7);
  static const Color purple200 = Color(0xFF9C27B0);
  static const Color purple300 = Color(0xFF8E24AA);
  static const Color purple400 = Color(0xFF7B1FA2);
  static const Color purple500 = Color(0xFF6A1B9A); // Violet standard

  static const Color pink50 = Color(0xFFF8BBD0);
  static const Color pink100 = Color(0xFFF48FB1);
  static const Color pink200 = Color(0xFFF06292);
  static const Color pink300 = Color(0xFFEC407A);
  static const Color pink400 = Color(0xFFE91E63);
  static const Color pink500 = Color(0xFFD81B60); // Rose standard

  // Dégradés
  static const Gradient blueGradient = LinearGradient(
    colors: [AppColors.blue500, AppColors.blue700],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient greenGradient = LinearGradient(
    colors: [AppColors.green400, AppColors.green600],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient purpleGradient = const LinearGradient(
    colors: [AppColors.purple400, AppColors.purple100],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient redGradient = LinearGradient(
    colors: [AppColors.red400, AppColors.red500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Couleurs primaires
  static const Color primary = Color(0xFF3B82F6); // Bleu par défaut, similaire à Tailwind
  static const Color secondary = Color(0xFFEF4444); // Rouge par défaut

  // Couleur blanche et noire
  static const Color white = Color(0xFFFFFFFF); // Blanc
  static const Color black = Color(0xFF000000); // Noir

  // Transparent
  static const Color transparent = Colors.transparent;
}
