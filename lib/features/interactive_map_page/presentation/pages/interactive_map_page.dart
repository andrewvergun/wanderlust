import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanderlust/common/widgets/forward_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../common/widgets/header.dart';
import '../../../../common/widgets/sidebar.dart';
import '../../../../config/theme/theme.dart';
import '../widgets/interactive_map.dart';
import '../../data/models/location_data.dart';

class InteractiveMapPage extends StatefulWidget {
  const InteractiveMapPage({super.key, this.selectedLocation});

  final LocationData? selectedLocation; // Add this parameter
  static const String path = 'interactive_map';

  @override
  State<InteractiveMapPage> createState() => _InteractiveMapPageState();
}

class _InteractiveMapPageState extends State<InteractiveMapPage> {
  LocationData? selectedLocation;
  bool showLocationDetails = false;
  bool showLocationDetailsExpanded = false;

  @override
  void initState() {
    super.initState();
    // Initialize with the passed location if available
    if (widget.selectedLocation != null) {
      selectedLocation = widget.selectedLocation;
      showLocationDetails = true;
    }
  }

  void _onLocationSelected(LocationData location) {
    setState(() {
      selectedLocation = location;
      showLocationDetails = true;
    });
  }

  void _closeLocationDetails() {
    setState(() {
      showLocationDetails = false;
      selectedLocation = null;
      showLocationDetailsExpanded = false;
    });
  }

  void _onMapTapped() {
    setState(() {
      showLocationDetails = false;
      selectedLocation = null;
    });
  }

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
            child: ListView(
              children: [
                const Header(isHeaderMin: true, title: 'Interactive map'),
                const SizedBox(height: 26),
                InteractiveMap(
                  mapHeight: 434,
                  onLocationSelected: _onLocationSelected,
                  onMapTapped: _onMapTapped,
                  selectedLocation: selectedLocation,
                ),
              ],
            ),
          ),
          if (showLocationDetails && selectedLocation != null)
            Positioned(
              bottom: 47,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: _closeLocationDetails,
                child: Center(
                  child: GestureDetector(
                    onTap: () {}, // Prevent tap from bubbling up
                    child: showLocationDetailsExpanded
                        ? _buildLocationDetailsExpanded()
                        : _buildLocationDetailsCard(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLocationDetailsCard() {
    if (selectedLocation == null) return const SizedBox.shrink();

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 252,
        maxWidth: double.infinity,
      ),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppTheme.interactiveMapContainerColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: 123,
              width: double.infinity,
              child: Image.network(
                selectedLocation!.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Content section
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedLocation!.name,
                        style: const TextStyle(
                          color: AppTheme.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      // Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            selectedLocation!
                                .description
                                .split('.')
                                .first +
                                '.',
                            style: const TextStyle(
                              color: Color(0xFFB8B8D4),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Forward button
                Align(
                  alignment: Alignment.center,
                  child: ForwardButton(
                    onPressed: () {
                      setState(() {
                        showLocationDetailsExpanded = true;
                      });
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

  Widget _buildLocationDetailsExpanded() {
    if (selectedLocation == null) return const SizedBox.shrink();

    return Container(
      constraints: const BoxConstraints(maxHeight: 628),
      decoration: BoxDecoration(
        color: AppTheme.interactiveMapContainerColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Container(
            padding: const EdgeInsets.all(17),
            height: 237,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                selectedLocation!.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
          // Content section
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Coordinates
                  Text(
                    'Coordinates: ${selectedLocation!.coordinates}',
                    style: const TextStyle(
                      color: AppTheme.buttonColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Title
                  Text(
                    selectedLocation!.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Description
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        selectedLocation!.description,
                        style: const TextStyle(
                          color: AppTheme.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Close button
                      FilledButton(
                        onPressed: _closeLocationDetails,
                        style: FilledButton.styleFrom(
                          alignment: Alignment.center,
                          elevation: 0,
                          backgroundColor: AppTheme.buttonColor,
                          iconColor: AppTheme.buttonTextColor,
                          textStyle: const TextStyle(color: AppTheme.buttonTextColor),
                          minimumSize: const Size(127, 56),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Close Map',
                              style: TextStyle(
                                color: AppTheme.buttonTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              "assets/images/close_icon.svg",
                              width: 15.17,
                              height: 15.17,
                              color: AppTheme.buttonTextColor,
                            ),
                          ],
                        ),
                      ),
                      // Action buttons (bookmark and share)
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              alignment: Alignment.center,
                              elevation: 0,
                              backgroundColor: AppTheme.buttonColor,
                              fixedSize: const Size(56, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: SvgPicture.asset("assets/images/bookmark_icon.svg"),
                          ),
                          const SizedBox(width: 12),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              alignment: Alignment.center,
                              elevation: 0,
                              backgroundColor: AppTheme.buttonColor,
                              fixedSize: const Size(56, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            child: SvgPicture.asset("assets/images/share_icon.svg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}