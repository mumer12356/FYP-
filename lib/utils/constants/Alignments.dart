
import '../../../../../utils/constants/exports.dart';

var StartAlignment= MainAxisAlignment.start;
var CentreAlignment= MainAxisAlignment.center;


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}