import 'package:flutter/material.dart';
import 'package:wanderlust/common/widgets/header.dart';
import 'package:wanderlust/common/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String path = 'home';

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
          ListView(
            children: [
              Header(isHeaderMin: false)
            ],
          ),
        ],
      ),

        
      
    );
  }
}
