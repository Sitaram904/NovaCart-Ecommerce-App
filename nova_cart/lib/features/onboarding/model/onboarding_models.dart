
class OnboardingModels {
  final String imageUrl;
  final String screenTitle;
  final String screenDetail;

  OnboardingModels({
    required this.imageUrl,
    required this.screenTitle,
    required this.screenDetail,
  });
}

abstract class OnBoardingContents {
 static List<OnboardingModels> contents = [
    OnboardingModels(
      imageUrl:
          'assets/images/first_image.png',
      screenTitle: 'Welcome To NovaCart',
      screenDetail:
          ' Discover a smarter way to shop online.Browse thousands of products easily.Find what you love in just a few taps.',
    ),

    OnboardingModels(
      imageUrl:'assets/images/secondimage.png',

      screenTitle: 'Find Product Faster',
      screenDetail:
          'Use smart filters for brand, color, and price.Choose the best option for your needs. Compare products instantly.',
    ),

    OnboardingModels(
      imageUrl:
          'assets/images/third_image.png',

      screenTitle: 'Shop With Confidence',

      screenDetail:
          'Enjoy a smooth and secure checkout.Track your orders anytime.Start shopping with NovaCart today.',
    ),
  ];
}
