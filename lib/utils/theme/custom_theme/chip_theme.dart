
import '../../../../../utils/constants/exports.dart';

class CChipTheme{
  CChipTheme._();

  static ChipThemeData lightChipTheme= ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.orangeAccent,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipTheme= const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.orangeAccent,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: Colors.white
  );

}