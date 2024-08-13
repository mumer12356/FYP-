
import '../../../../../utils/constants/exports.dart';

class CIconButtonTheme {
  CIconButtonTheme._(); //To avoid creating instanves

  static final  lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      //backgroundColor: Colors.orangeAccent,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18.0),
    ),
  );

  static final  DarkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      //backgroundColor: Colors.orangeAccent,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18.0),
    ),
  );

}