import 'package:flutter/material.dart';
import 'package:wanderlust/common/widgets/sidebar.dart';
import '../../popular_places_page/data/save_place_service.dart';
import '../../../common/widgets/header.dart';
import '../../interactive_map_page/data/models/location_data.dart';
import '../../popular_places_page/presentation/widgets/popular_place_widget.dart';

class SavedPlacesPage extends StatefulWidget {
  const SavedPlacesPage({super.key});

  static const String path = 'saved_places';

  @override
  State<SavedPlacesPage> createState() => _SavedPlacesPageState();
}

class _SavedPlacesPageState extends State<SavedPlacesPage> {
  late Future<List<LocationData>> _savedPlacesFuture;

  @override
  void initState() {
    super.initState();
    _savedPlacesFuture = SavePlaceService.getSavedPlaces();
  }

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
                Header(isHeaderMin: true, title: 'Saved Places'),
                Expanded(
                  child: FutureBuilder<List<LocationData>>(
                    future: _savedPlacesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text("Error loading saved places"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No saved places yet"));
                      }

                      final places = snapshot.data!;
                      return ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return PopularPlaceWidget(location: places[index]);
                        },
                      );
                    },
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
