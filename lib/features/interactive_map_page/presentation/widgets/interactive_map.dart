import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../config/theme/theme.dart';
import '../../data/models/location_data.dart';

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({
    super.key,
    required this.mapHeight,
    this.onLocationSelected,
    this.onMapTapped,
    this.selectedLocation,
  });

  final double mapHeight;
  final Function(LocationData)? onLocationSelected;
  final VoidCallback? onMapTapped;
  final LocationData? selectedLocation;

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  double zoom = 5.5;

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  Future<void> _createMarkers() async {
    final BitmapDescriptor customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      "assets/images/marker.png",
    );

    setState(() {
      markers.clear();
      for (LocationData location in LocationsData.locations) {
        markers.add(
          Marker(
            markerId: MarkerId(location.id),
            position: location.position,
            onTap: () => _onMarkerTapped(location),
            icon: customIcon,
          ),
        );
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    final style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/dark_map.json');
    controller.setMapStyle(style);
  }

  void _onMarkerTapped(LocationData location) {
    // Animate camera to the selected location
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location.position,
          zoom: 12,
        ),
      ),
    );

    // Notify parent widget about the selection
    widget.onLocationSelected!(location);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: widget.mapHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: AppTheme.borderGradient,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(51, 10),
              zoom: zoom,
            ),
            markers: markers,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onTap: (_) {
              widget.onMapTapped!();
            },
          ),
        ),
      ),
    );
  }
}