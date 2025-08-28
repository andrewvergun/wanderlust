import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wanderlust/common/animations/text_animation.dart';
import 'package:wanderlust/common/widgets/header.dart';
import '../../../common/widgets/header_button.dart';
import '../../../common/widgets/sidebar.dart';
import '../../../config/theme/theme.dart';
import '../data/models/categories_data.dart';

class FactsDisplayPage extends StatefulWidget {
  final String categoryName;

  const FactsDisplayPage({
    super.key,
    required this.categoryName,
  });

  static const String path = 'facts_display';

  @override
  State<FactsDisplayPage> createState() => _FactsDisplayPageState();
}

class _FactsDisplayPageState extends State<FactsDisplayPage> {
  int currentFactIndex = 0;
  List<String> facts = [];

  @override
  void initState() {
    super.initState();
    _loadFacts();
  }

  void _loadFacts() {
    final category = categories.firstWhere(
          (cat) => cat.name == widget.categoryName,
      orElse: () => categories.first,
    );
    facts = category.facts;
  }

  void _nextFact() {
    if (currentFactIndex < facts.length - 1) {
      setState(() {
        currentFactIndex++;
      });
    }
  }

  void _previousFact() {
    if (currentFactIndex > 0) {
      setState(() {
        currentFactIndex--;
      });
    }
  }

  void _shareFact() {
    Share.share(facts[currentFactIndex]);
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
                const SizedBox(height: 20),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.categoryName,
                          style: const TextStyle(
                            color: AppTheme.buttonColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 21),
                        Expanded(
                          child: BlurTextAnimation(text:
                            facts.isNotEmpty ? facts[currentFactIndex] : '',
                            key: ValueKey(currentFactIndex),
                            style: const TextStyle(
                              color: AppTheme.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            HeaderButton(
                              onPressed: _shareFact,
                              buttonIcon: 'assets/images/share_icon.svg',
                              buttonIconWidth: 16.5,
                              buttonIconHeight: 19.5,
                              buttonText: 'Share',
                              width: 140,
                              height: 56,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: currentFactIndex > 0 ? _previousFact : null,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: currentFactIndex > 0
                                    ? AppTheme.buttonColor
                                    : AppTheme.buttonColor.withOpacity(0.3),
                                size: 20,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.buttonColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${currentFactIndex + 1}/${facts.length}',
                                style: const TextStyle(
                                  color: AppTheme.buttonColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: currentFactIndex < facts.length - 1 ? _nextFact : null,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: currentFactIndex < facts.length - 1
                                    ? AppTheme.buttonColor
                                    : AppTheme.buttonColor.withOpacity(0.3),
                                size: 20,
                              ),
                            ),
                          ],
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