import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../widgets/header_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: double.infinity,
        backgroundColor: AppTheme.drawerBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              margin: EdgeInsets.only(top: 27),
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
            SizedBox(height: 46),

            _buildMenuItem('Home', isActive: true),
            _buildMenuItem('Popular places'),
            _buildMenuItem('Saved places'),
            _buildMenuItem('Interesting facts'),
            _buildMenuItem('Interactive map'),
            _buildMenuItem('About app'),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 28),
              child: HeaderButton(
                onPressed: Scaffold.of(context).closeEndDrawer,
                buttonIcon: 'assets/images/close_icon.svg',
                buttonText: 'Close',
                buttonIconWidth: 21,
                buttonIconHeight: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: AppTheme.white,
          decoration: isActive ? TextDecoration.underline : TextDecoration.none,
          decorationColor: AppTheme.buttonColor,
          decorationThickness: 1,
        ),
      ),
    );
  }
}
