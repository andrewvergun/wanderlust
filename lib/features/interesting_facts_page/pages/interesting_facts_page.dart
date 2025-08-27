import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlust/common/widgets/header.dart';
import 'package:wanderlust/features/interesting_facts_page/widgets/interesting_fact_button.dart';
import 'package:wanderlust/features/interesting_facts_page/pages/facts_display_page.dart';

import '../../../common/widgets/sidebar.dart';
import '../../../config/theme/theme.dart';

class InterestingFactsPage extends StatefulWidget {
  const InterestingFactsPage({super.key});

  static const String path = 'interesting_facts';

  @override
  State<InterestingFactsPage> createState() => _InterestingFactsPageState();
}

class _InterestingFactsPageState extends State<InterestingFactsPage> {
  void _navigateToCategory(String categoryName) {
    context.pushNamed(
      FactsDisplayPage.path,
      extra: categoryName,
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
            child: Column(
              children: [
                Header(isHeaderMin: true, title: 'Interesting facts'),
                SizedBox(height: 20), // reduce height to avoid overflow
                Flexible(
                  flex: 4,
                  child: Image.asset(
                    "assets/images/attention_mark.png",
                    width: 241,
                    height: 278,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
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
                          style: const TextStyle(
                            color: AppTheme.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 23),
                        InterestingFactButton(
                          title: 'Cultural and traditions facts',
                          onPressed: () => _navigateToCategory('Culture and Traditions'),
                        ),
                        const SizedBox(height: 11),
                        InterestingFactButton(
                          title: 'History and Architecture',
                          onPressed: () => _navigateToCategory('History and Architecture'),
                        ),
                        const SizedBox(height: 11),
                        InterestingFactButton(
                          title: 'Nature and Modernity',
                          onPressed: () => _navigateToCategory('Nature and Modernity'),
                        ),
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