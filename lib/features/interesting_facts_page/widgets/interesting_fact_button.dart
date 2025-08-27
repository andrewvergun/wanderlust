import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/theme.dart';

class InterestingFactButton extends StatelessWidget {
  const InterestingFactButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        alignment: Alignment.center,
        elevation: 0,
        backgroundColor: AppTheme.buttonColor,
        iconColor: AppTheme.buttonTextColor,
        textStyle: const TextStyle(
          color: AppTheme.buttonTextColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.buttonTextColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset(
            "assets/images/arrow-forward.svg",
            // Consider changing to map icon
            width: 15.17,
            height: 15.17,
            color: AppTheme.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
