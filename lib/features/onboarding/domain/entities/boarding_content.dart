import '../../../../core/constants/app_assets.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;
  final String buttonLabel;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
    required this.buttonLabel
  });
}
List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to HashTag Generator!",
    image: AppAssets.boarding1,
    desc: "Quickly find the best hashtags for your posts to boost engagement and reach. Simply input your content, and get tailored recommendations in seconds.",
    buttonLabel: "Next"
  ),
  OnboardingContents(
      title: "Customizable Hashtag Suggestions",
      image: AppAssets.boarding2,
      desc: "Organize and save your favorite hashtags into custom groups for easy access. Effortlessly apply these groups to different types of content and campaigns.",
      buttonLabel: "Next"
  ),
  OnboardingContents(
      title: "Analytics and Insights",
      image: AppAssets.boarding3,
      desc: "Monitor the effectiveness of your hashtags with real-time analytics. Track which hashtags drive the most engagement and adjust your strategy for optimal results.",
      buttonLabel: "Next"
  )
];