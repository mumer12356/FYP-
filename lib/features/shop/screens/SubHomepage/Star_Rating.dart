import '../../../../../utils/constants/exports.dart';


class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 12,
    this.filledColor = Colors.yellow,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate( 5,  /// Generate star on the basis of rating out of 5
            (index) {
          if (index < rating) {
            return Icon(
              Icons.star,
              size: size,
              color: filledColor,
            );
          } else {
            return Icon(
              Icons.star_border,
              size: size,
              color: emptyColor,
            );
          }
        },
      ),
    );
  }
}