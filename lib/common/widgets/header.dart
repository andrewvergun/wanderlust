import 'package:flutter/material.dart';
import 'package:wanderlust/common/widgets/header_button.dart';

import '../../config/theme/theme.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.isHeaderMin, this.title});

  final bool isHeaderMin;
  final String? title;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isHeaderMin
                ? Text(
                    widget.title!,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset("assets/images/icon4.png"),
                    ),
                    height: 168,
                    width: 168,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: AppTheme.borderGradient,
                    ),
                  ),
            HeaderButton(
              onPressed: Scaffold.of(context).openEndDrawer,
              buttonIcon: 'assets/images/menu_icon.svg',
              buttonText: 'Menu',
              buttonIconWidth: 29.25,
              buttonIconHeight: 19.5,
              width: 144,
              height: 78,
            ),
          ],
        ),
      ),
    );
  }
}
