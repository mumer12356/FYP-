
import '../../../../utils/constants/exports.dart';

class CShimmerEffect extends StatelessWidget {
  const CShimmerEffect({super.key,
    required this.width, required this.height,
    this.radius = 15,
    this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? CColor.darkerGrey : CColor.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),

    );
  }
}
