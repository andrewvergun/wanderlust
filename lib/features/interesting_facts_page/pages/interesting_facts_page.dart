import 'package:flutter/material.dart';
import 'package:wanderlust/common/widgets/header.dart';
import 'package:wanderlust/features/interesting_facts_page/widgets/interesting_fact_button.dart';

import '../../../common/widgets/sidebar.dart';
import '../../../config/theme/theme.dart';

class InterestingFactsPage extends StatefulWidget {
  const InterestingFactsPage({super.key});

  static const String path = 'interesting_facts';

  @override
  State<InterestingFactsPage> createState() => _InterestingFactsPageState();
}

class _InterestingFactsPageState extends State<InterestingFactsPage> {
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
            child: Column(
              children: [
                Header(isHeaderMin: true, title: 'Interesting facts'),
                SizedBox(height: 54),
                Image.asset(
                  "assets/images/attention_mark.png",
                  width: 241,
                  height: 278,
                  fit: BoxFit.cover,
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 340,
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      border: AppTheme.borderGradient,
                      color: AppTheme.interestingFactsContainerColor,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Click on a category and learn the facts.',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 23),
                        InterestingFactButton(title: 'Cultural and traditions facts', onPressed: () {}),
                        SizedBox(height: 11),
                        InterestingFactButton(title: 'History and Architecture', onPressed: () {}),
                        SizedBox(height: 11),
                        InterestingFactButton(title: 'Nature and Modernity', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
