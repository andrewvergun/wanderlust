import 'package:flutter/material.dart';

import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sidebar.dart';
import '../widgets/interactive_map.dart';

class InteractiveMapPage extends StatelessWidget {
  const InteractiveMapPage({super.key});

  static const String path = 'interactive_map';

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
            child: ListView(
              children: [
                Header(isHeaderMin: true, title: 'Interactive map'),
                SizedBox(height: 26),
                InteractiveMap(mapHeight: 434),
              ],
            ),
          ),
        ],
      ),



    );;
  }
}
