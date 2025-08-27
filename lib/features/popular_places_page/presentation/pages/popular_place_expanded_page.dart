import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/popular_place_expanded_widget.dart';
import '../../../interactive_map_page/data/models/location_data.dart';
import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sidebar.dart';

class PopularPlaceExpandedPage extends StatefulWidget {
  const PopularPlaceExpandedPage({super.key, required this.location});

  final LocationData location;
  static const String path = 'popular_place_expanded';

  @override
  State<PopularPlaceExpandedPage> createState() => _PopularPlaceExpandedPageState();
}

class _PopularPlaceExpandedPageState extends State<PopularPlaceExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Sidebar(),
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
            child: Column(
              children: [
                const Header(isHeaderMin: true, title: 'Popular places'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PopularPlaceExpandedWidget(location: widget.location),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}