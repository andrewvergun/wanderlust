import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanderlust/config/theme/theme.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: SvgPicture.asset("assets/images/arrow-forward.svg"),
      style: FilledButton.styleFrom(
        alignment: Alignment.center,
        elevation: 0,
        backgroundColor: AppTheme.buttonColor,
        fixedSize: Size(56, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
