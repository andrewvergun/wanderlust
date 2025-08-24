import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/theme.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({super.key, required this.onPressed, required this.buttonIcon,required this.buttonIconWidth,required this.buttonIconHeight, required this.buttonText});
  final VoidCallback onPressed;
  final String buttonIcon;
  final double buttonIconWidth;
  final double buttonIconHeight;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        alignment: Alignment.center,
        elevation: 0,
        backgroundColor: AppTheme.buttonColor,
        iconColor: AppTheme.buttonTextColor,
        textStyle: TextStyle(color: AppTheme.buttonTextColor),
        fixedSize: Size(144, 78),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            buttonIcon,
            width: buttonIconWidth,
            height: buttonIconHeight,
            color: AppTheme.buttonTextColor,
          ),
          SizedBox(width: 20),
          Text(
            buttonText,
            style: TextStyle(
              color: AppTheme.buttonTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );

  }
}
