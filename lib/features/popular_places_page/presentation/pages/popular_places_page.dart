import 'package:flutter/material.dart';
import '../widgets/popular_place_widget.dart';
import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sidebar.dart';
import '../../../interactive_map_page/data/models/location_data.dart';

class PopularPlacesPage extends StatefulWidget {
  const PopularPlacesPage({super.key});

  static const String path = 'popular_places';

  @override
  State<PopularPlacesPage> createState() => _PopularPlacesPageState();
}

class _PopularPlacesPageState extends State<PopularPlacesPage> {
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
            child: Column(
              children: [
                Header(isHeaderMin: true, title: 'Popular Places'),
                Expanded(child: ListView.builder(
                  itemCount: LocationsData.locations.length,
                  itemBuilder: (context, index) {
                    return PopularPlaceWidget(location: LocationsData.locations[index]);
                  },
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
