import '../../../../../utils/constants/exports.dart';

class CColor{
  CColor._();

  ///App Basic Colors
  static const Color primary=Color(0xFFF57C00);
  static const Color secondary=Color(0xFFFFE24B);
  static const Color accent=Color(0xFFb0c7ff);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9a),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ]
  );

  // Text Colors
  static const Color textprimary=Color(0xFF333333);
  static const Color textsecondary=Color(0xFF6C757D);
  static const Color textaccent=Colors.white;

  // Background Colors
  static const Color light=Color(0x0ff6f6f6);
  static const Color dark=Color(0xFF272727);
  static const Color primaryBackground=Color(0x0ff3f5ff);

  // Background Container Colors
  static const Color lightContainer=Color(0x0ff6f6f6);
  static  Color darkContainer=Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonprimary=Color(0xFF4b68ff);
  static const Color buttonsecondary=Color(0xFF6C757D);
  static const Color buttonaccent=Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderprimary=Color(0xFFD9D9D9);
  static const Color bordersecondary=Color(0xFFE6E6E6);

  // Error And Validation Colors
  static const Color error=Color(0xFFD32F2F);
  static const Color success=Color(0xFF388E3C);
  static const Color warning=Color(0xFFF57C00);
  static const Color info=Color(0xFF1976D2);

  //Neutral Shades
  static const Color black=Color(0xFF232323);
  static const Color darkerGrey=Color(0xFF4F4F4F);
  static const Color darkGrey=Color(0xFF939393);
  static const Color grey=Color(0xFFE0E0E0);
  static const Color softGrey=Color(0xFFF4F4F4);
  static const Color lightGrey=Color(0xFFF9F9F9);
  static const Color white=Color(0xFFFFFFFF);



}