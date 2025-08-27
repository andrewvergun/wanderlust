import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlust/common/widgets/forward_button.dart';
import 'package:wanderlust/common/widgets/header.dart';
import 'package:wanderlust/common/widgets/sidebar.dart';

import '../../../../config/theme/theme.dart';
import '../../../interactive_map_page/presentation/widgets/interactive_map.dart';
import '../../../interactive_map_page/data/models/location_data.dart';
import '../../../popular_places_page/presentation/widgets/popular_place_widget.dart';

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
          SafeArea(
            child: ListView(
              children: [
                Header(isHeaderMin: false),
                SizedBox(height: 32),

                // Interactive Map Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Interactive Map',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppTheme.white,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    InteractiveMap(mapHeight: 129),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 32,
                      child: Center(
                        child: ForwardButton(
                          onPressed: () {
                            context.pushNamed('interactive_map');
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                // Places for Visit Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Places for visit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppTheme.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to popular places page
                          context.pushNamed('popular_places');
                        },
                        child: Text(
                          'Open more',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppTheme.buttonColor, // Yellow color from the image
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppTheme.buttonColor,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Popular Place Widget
                PopularPlaceWidget(location: LocationsData.locations[0]),

                SizedBox(height: 32), // Bottom spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}