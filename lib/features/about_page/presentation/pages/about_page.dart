import 'package:flutter/material.dart';
import 'package:wanderlust/common/widgets/header.dart';
import 'package:wanderlust/common/widgets/header_button.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../common/widgets/sidebar.dart';
import '../../../../config/theme/theme.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  static const String path = 'about';

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  void share () async {
    await SharePlus.instance.share(
        ShareParams(text: 'Check out the Wanderlust app!', subject: 'Wanderlust App')
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      endDrawer: Sidebar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(isHeaderMin: true, title: 'About App'),
                  Container(
                    margin: EdgeInsets.only(top: 43, bottom: 31),
                    height: 228,
                    width: 228,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: AppTheme.borderGradient,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset("assets/images/icon4.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(27),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.drawerBackgroundColor,
                        border: AppTheme.borderGradient,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This is your interactive guide to Germany.\nInside you will find unique places, interesting facts and the opportunity to create your own routes. Collect your favorite locations, discover new ones every day and travel in your own style.',
                            style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 18),
                          HeaderButton(
                            onPressed: share,
                            buttonIcon: 'assets/images/share_icon.svg',
                            buttonIconWidth: 16.5,
                            buttonIconHeight: 19.5,
                            buttonText: 'Share',
                            width: 140,
                            height: 56,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
