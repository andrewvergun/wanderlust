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
      onPressed: onPressed,
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
        minimumSize: const Size(349, 56),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.buttonTextColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            "assets/images/arrow-forward.svg",
            width: 15.17,
            height: 15.17,
            color: AppTheme.buttonTextColor,
          ),
        ],
      ),
    );
  }
}

