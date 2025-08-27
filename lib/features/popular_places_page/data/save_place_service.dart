import 'package:shared_preferences/shared_preferences.dart';
import '../../interactive_map_page/data/models/location_data.dart';

class SavePlaceService {
  static const String _key = 'saved_places';

  static Future<void> toggleSavePlace(String locationId) async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList(_key) ?? [];

    if (savedIds.contains(locationId.toString())) {

      savedIds.remove(locationId.toString());
    } else {

      savedIds.add(locationId.toString());
    }

    await prefs.setStringList(_key, savedIds);
  }


  static Future<List<LocationData>> getSavedPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList(_key) ?? [];


    return LocationsData.locations
        .where((loc) => savedIds.contains(loc.id.toString()))
        .toList();
  }

  static Future<bool> isSaved(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList(_key) ?? [];
    return savedIds.contains(id.toString());
  }
}
