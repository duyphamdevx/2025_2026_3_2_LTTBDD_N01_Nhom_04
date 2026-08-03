import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Bảng màu chính của ứng dụng PawCare, lấy theo tông cam - hồng - teal
/// giống với thiết kế gốc.
class AppColors {
  AppColors._();

  static const Color primaryOrange = Color(0xFFFF8A5C);
  static const Color primaryOrangeDark = Color(0xFFFF7043);
  static const Color secondaryTeal = Color(0xFF3DBFA8);
  static const Color tealLight = Color(0xFFBFEFE6);
  static const Color pinkLight = Color(0xFFFFD9D6);
  static const Color creamLight = Color(0xFFFFECC7);
  static const Color lavenderLight = Color(0xFFE3DCF7);
  static const Color background = Color(0xFFFDF3EC);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF3A2E2A);
  static const Color textGrey = Color(0xFF9B9B9B);
  static const Color allergyRed = Color(0xFFFF6B5E);
  static const Color allergyRedBg = Color(0xFFFFE1DE);
  static const Color success = Color(0xFF3DBFA8);

  /// Bảng màu pastel xoay vòng để phân biệt từng thú cưng trong danh sách.
  static const List<Color> petPalette = [
    pinkLight,
    tealLight,
    creamLight,
    lavenderLight,
  ];

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA25C), Color(0xFFFF7A59)],
  );

  static const LinearGradient tealHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3DBFA8), Color(0xFF2E9E8C)],
  );

  static const LinearGradient avatarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFC15C), Color(0xFFFF7A59)],
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    // Baloo 2: font tròn, thân thiện - gần với phong cách bo tròn dễ thương
    // của thiết kế gốc hơn font mặc định.
    final baseTextTheme = GoogleFonts.baloo2TextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryOrange,
        primary: AppColors.primaryOrange,
        secondary: AppColors.secondaryTeal,
        surface: AppColors.cardWhite,
      ),
      textTheme: baseTextTheme.copyWith(
        headlineSmall: baseTextTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: AppColors.textDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrangeDark,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.baloo2(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF6F1EC),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryOrangeDark, width: 1.5),
        ),
      ),
    );
  }

  static BoxDecoration cardDecoration({double radius = 20}) {
    return BoxDecoration(
      color: AppColors.cardWhite,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
