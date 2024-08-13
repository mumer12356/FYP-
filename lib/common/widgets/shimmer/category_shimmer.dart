
import '../../../../utils/constants/exports.dart';

class CCategoryShimmer extends StatelessWidget {
  const CCategoryShimmer({super.key,
    this.itemCount = 6
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__)=> const SizedBox(width: CSizes.spaceBtwItems,),
        itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              CShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(width: CSizes.spaceBtwItems / 2,),

              /// Text
              CShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
