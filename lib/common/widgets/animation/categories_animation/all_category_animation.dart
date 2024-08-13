import '../../../../utils/constants/exports.dart';

///use in All categories page
// Define a helper function for slide transition navigation
void navigateWithSlideTransition(BuildContext context, Widget destination) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutSine;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  ));
}