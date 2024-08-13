
import '../../../../../utils/constants/exports.dart';

class CElevatedButtonTheme{
  CElevatedButtonTheme._(); //To avoid creating instanves

  static final  lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.orangeAccent,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.orangeAccent),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.white),
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.circular(12.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(10)
        ),
      ),
    ),
  );

  static final  darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.orangeAccent,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.orangeAccent),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.white),
      shape: const RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(12.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(10)
        ),
      ),
    ),
  );
}