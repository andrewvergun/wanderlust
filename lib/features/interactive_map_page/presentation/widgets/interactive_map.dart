import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../config/theme/theme.dart';
import '../../data/models/location_data.dart';

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LocationData? selectedLocation;
  bool showLocationDetails = false;

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }



  Future<void> _createMarkers() async {
    setState(() {
      markers.clear();
      for (LocationData location in LocationsData.locations) {
        markers.add(
          Marker(
            markerId: MarkerId(location.id),
            position: location.position,
            onTap: () => _onMarkerTapped(location),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
    });
  }



  void _onMarkerTapped(LocationData location) {
    setState(() {
      selectedLocation = location;
      showLocationDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 434,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: AppTheme.borderGradient,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: GoogleMap(

            initialCameraPosition: const CameraPosition(
              target: LatLng(51, 10),
              zoom: 5.5,
            ),
            markers: markers,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            onTap: (_) {
              setState(() {
                showLocationDetails = false;
                selectedLocation = null;
              });
            },
          ),
        ),
      ),
    );
  }
}
