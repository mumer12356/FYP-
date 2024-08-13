
import '../../../../../utils/constants/exports.dart';

class CCheckboxTheme{
  CCheckboxTheme._();

  ///Light theme
  static CheckboxThemeData lightCheckBoxThemeData= CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.orangeAccent;
      }else {
        return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkCheckBoxThemeData= CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.orangeAccent;
      }else {
        return Colors.transparent;
      }
    }),
  );
}