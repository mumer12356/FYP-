
import '../../../../../utils/constants/exports.dart';

class CtextTheme{
  CtextTheme._();

  static TextTheme lightTextTheme=TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
    headlineMedium: const TextStyle().copyWith(fontSize:24,fontWeight: FontWeight.w600,color: Colors.black),
    headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
    titleMedium: const TextStyle().copyWith(fontSize:16,fontWeight: FontWeight.w500,color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),

    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
    bodyMedium: const TextStyle().copyWith(fontSize:14,fontWeight: FontWeight.normal,color: Colors.black),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),
    labelMedium: const TextStyle().copyWith(fontSize:12,fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),

  );


  static TextTheme darkTextTheme=TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontSize:24,fontWeight: FontWeight.w600,color: Colors.white),
    headlineSmall: const TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontSize:16,fontWeight: FontWeight.w500,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontSize:14,fontWeight: FontWeight.normal,color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontSize:12,fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
  );





/////Font ===20
  static TextStyle Welcomestyle = const TextStyle(
      fontSize: 20,fontWeight: FontWeight.bold,color: CColor.primary
  );



/////// Home Text Style
  static TextStyle HomeText=const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: CColor.primary);



////Font ===15
  static TextStyle F15B=const TextStyle(fontSize: 15,fontWeight: FontWeight.bold);

  /// Font 15
  static TextStyle FCOrange= const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: CColor.black);

  /// Drawer Style
  static TextStyle DrawerStyle= const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: CColor.primary,
    fontStyle: FontStyle.italic,
  );

}