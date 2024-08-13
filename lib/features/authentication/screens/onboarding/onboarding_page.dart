
import '../../../../utils/constants/exports.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
    this.isNetworkImage = false,
    this.isLottieAnimation = false,
  });

  final String image, title, subTitle;
  final bool isNetworkImage;
  final bool isLottieAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CSizes.spaceBtwSetions),
      child: Column(
        children: [
          if (isLottieAnimation)
            Lottie.network(
              image,
              width: CHelperFunctions.screenWidth() * 1.0,
              height: CHelperFunctions.screenHeight() * 0.6,
              fit: BoxFit.contain,
            )
          else if (isNetworkImage)
            FutureBuilder<String>(
              future: _getCachedImage(image),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Text('Error loading image');
                }
                return CachedNetworkImage(
                  imageUrl: snapshot.data!,
                  width: CHelperFunctions.screenWidth() * 1.0,
                  height: CHelperFunctions.screenHeight() * 0.6,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const CCategoryShimmer(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              },
            )
          else
            Image(
              image: AssetImage(image),
              width: CHelperFunctions.screenWidth() * 1.0,
              height: CHelperFunctions.screenHeight() * 0.6,
              fit: BoxFit.contain,
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<String> _getCachedImage(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedImage = prefs.getString(url);
    if (cachedImage != null) {
      return cachedImage;
    } else {
      await prefs.setString(url, url);
      return url;
    }
  }
}
