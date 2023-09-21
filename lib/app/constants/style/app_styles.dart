part of '../constants.dart';

class AppStyles {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
  static final font = _Font();
  //
  static final theme = _Theme();
  static final shadows = _Shadows();
}

class _Colors {
  final transparent = Colors.transparent;
  final cyan = Colors.cyan; //0,188,227
  final white = Colors.white;
  final black = Colors.black;
  final grey = const Color(0xFF9E9E9E);
  final bgDark = const Color(0xff333951);
  final red = const Color(0xFFEF5350);
  //
  // static const Color grey = Color(0xFF9E9E9E);
  // static const Color cyan = Colors.cyan;
  // static const Color white = Colors.white;
  // static const Color accentColors = Color.fromRGBO(13, 245, 227, 1);
  // static const Color txtColor = Color.fromRGBO(230, 225, 228, 1);

  //#2c2b3f bgDark
  //#00CEF1 cyan
  // static const Color bgTextField = Color.fromRGBO(56, 48, 77, 1);
}

class _Font {
  static const poppinsBold = 'poppins_bold';
  static const poppinsMedium = 'poppins_medium';
  static const poppinsSemiBold = 'poppins_semi_bold';
}

class _TextStyles {
  final poppinsMedium = TextStyle(
      fontFamily: _Font.poppinsMedium,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      fontWeight: FontWeight.bold,
      color: AppStyles.colors.bgDark);
  final poppinsSemiBold = TextStyle(
      fontFamily: _Font.poppinsSemiBold,
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      fontWeight: FontWeight.bold,
      color: AppStyles.colors.bgDark);
  final poppinsBold = TextStyle(
      wordSpacing: 0.5,
      letterSpacing: 0.5,
      fontFamily: _Font.poppinsBold,
      fontWeight: FontWeight.bold,
      color: AppStyles.colors.bgDark);
}

class _Shadows {
  final softShadow = [
    const BoxShadow(
      blurRadius: 20,
      offset: Offset(0, 2),
    ),
  ];

  final hardShadow = [
    const BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ];
}

class _Theme {
  final defaultTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppStyles.colors.cyan,
    canvasColor: Colors.transparent, //warna oveflow listview transparant
  );
}
