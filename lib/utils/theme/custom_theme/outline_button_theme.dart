
import '../../../../../utils/constants/exports.dart';

class COutlineButtonTheme{
  COutlineButtonTheme._();

  static final  lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.orange),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16.0),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.black),
      shape: const RoundedRectangleBorder(
       // borderRadius: BorderRadius.circular(14.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(10)
        ),
      ),
    ),
  );

  static final  darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.orangeAccent),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16.0),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.black),
      shape: const RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(14.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(10)
        ),
      ),
    ),
  );
}