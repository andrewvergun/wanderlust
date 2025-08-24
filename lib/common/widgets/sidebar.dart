import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlust/features/about_page/presentation/pages/about_page.dart';
import 'package:wanderlust/features/interactive_map_page/pages/interactive_map_page.dart';
import '../../config/theme/theme.dart';
import '../../features/home_page/presentation/pages/home_page.dart';
import '../widgets/header_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {

    final String currentRoute = GoRouterState.of(context).uri.toString();

    return SafeArea(
      child: Drawer(
        width: double.infinity,
        backgroundColor: AppTheme.drawerBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 27),
              height: 168,
              width: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                border: AppTheme.borderGradient,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Image.asset("assets/images/icon4.png"),
              ),
            ),
            SizedBox(height: 46),

            _buildMenuItem(
              'Home',
              routeName: HomePage.path,
              isActive: currentRoute.contains(HomePage.path) || currentRoute == '/',
            ),
            _buildMenuItem('Popular places'),
            _buildMenuItem('Saved places'),
            _buildMenuItem('Interesting facts'),
            _buildMenuItem('Interactive map',
              routeName: InteractiveMapPage.path,
              isActive: currentRoute.contains(InteractiveMapPage.path),),
            _buildMenuItem(
              'About app',
              routeName: AboutPage.path,
              isActive: currentRoute.contains(AboutPage.path),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 28),
              child: HeaderButton(
                onPressed: Scaffold.of(context).closeEndDrawer,
                buttonIcon: 'assets/images/close_icon.svg',
                buttonText: 'Close',
                buttonIconWidth: 21,
                buttonIconHeight: 21,
                width: 144,
                height: 78,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool isActive = false, String? routeName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          if (routeName != null) {
            context.goNamed(routeName);
          }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: AppTheme.white,
              ),
            ),
            if (isActive)
              Positioned(
                bottom: 0,
                child: Container(
                  height: 2,
                  width: title.length * 20,
                  color: AppTheme.buttonColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}