import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlust/config/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const String path = 'onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  void _nextPage() {
    _controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    context.goNamed('home');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                // LoadingIndicator(),
                _buildOnBoardingPage(
                  image: "assets/images/onboarding1.png",

                  imageWidth: 295,
                  imageTopMargin: 54,
                  title: 'Hello',
                  subtitle: 'My name is Sofia, I am your guide.',
                  description:
                      'Together we will embark on a journey through the most interesting places in Germany.',
                  buttonText: 'Hello, Sofia',
                  onPressed: () => _nextPage(),
                ),
                _buildOnBoardingPage(
                  image: 'assets/images/onboarding2.png',
                  imageWidth: 393,
                  imageHeight: 393,
                  imageTopMargin: 51,
                  description:
                      'I will show you castles, cities, mountains and legends. Here you will find stories, facts and routes to experience the real atmosphere of the country.',
                  buttonText: 'Ok, next',
                  onPressed: () => _nextPage(),
                ),
                _buildOnBoardingPage(
                  image: 'assets/images/onboarding3.png',
                  imageWidth: 393,
                  imageHeight: 393,
                  imageTopMargin: 51,
                  description:
                      'Collect your favorite places, create your own routes, and discover new ones every day. Ready to travel with me?',
                  buttonText: 'Yes, start',
                  onPressed: () => finishOnboarding(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildOnBoardingPage({
  required String image,
  required double imageWidth,
  double? imageHeight,
  required double imageTopMargin,
  String? title,
  String? subtitle,
  String? description,
  required String buttonText,
  required VoidCallback onPressed,
}) {
  return Column(
    children: [
      SizedBox(height: imageTopMargin),
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fitHeight,
              height: imageHeight,
              width: imageWidth,
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppTheme.containerColor,
          border: AppTheme.borderGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null && title.isNotEmpty)
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 2),
            if (subtitle != null && subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 18),
            if (description != null && description.isNotEmpty)
              Text(
                description,
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            SizedBox(height: 27),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),

                  width: 147,
                  height: 62,
                  decoration: BoxDecoration(
                    color: AppTheme.buttonColor.withAlpha(70),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                FilledButton(
                  onPressed: onPressed,
                  style: FilledButton.styleFrom(
                    alignment: Alignment.center,
                    elevation: 0,

                    backgroundColor: AppTheme.buttonColor,
                    iconColor: AppTheme.buttonTextColor,
                    textStyle: TextStyle(color: AppTheme.buttonTextColor),
                    minimumSize: Size(147, 62),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 26,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: TextStyle(
                          color: AppTheme.buttonTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/images/arrow-forward.svg',
                        width: 16,
                        height: 16,
                        color: AppTheme.buttonTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 41),
          ],
        ),
      ),
    ],
  );
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(color: Colors.white, size: 33),
    );
  }
}
