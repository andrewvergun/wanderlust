import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlust/features/popular_places_page/data/save_place_service.dart';
import '../../../../config/theme/theme.dart';
import '../../../interactive_map_page/data/models/location_data.dart';

class PopularPlaceExpandedWidget extends StatefulWidget {
  const PopularPlaceExpandedWidget({super.key, required this.location});

  final LocationData location;

  @override
  State<PopularPlaceExpandedWidget> createState() => _PopularPlaceExpandedWidgetState();
}

class _PopularPlaceExpandedWidgetState extends State<PopularPlaceExpandedWidget> {
  @override
  Widget build(BuildContext context) {
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
                widget.location.imageUrl,
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
                    'Coordinates: ${widget.location.coordinates}',
                    style: const TextStyle(
                      color: AppTheme.buttonColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Title
                  Text(
                    widget.location.name,
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
                        widget.location.description,
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
                      // Open Map button
                      FilledButton(
                        onPressed: () {
                          context.goNamed(
                            'interactive_map',
                            extra: widget.location,
                          );
                        },
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
                              'Open Map',
                              style: TextStyle(
                                color: AppTheme.buttonTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            SvgPicture.asset(
                              "assets/images/arrow-forward.svg", // Consider changing to map icon
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
                            onPressed: SavePlaceService.toggleSavePlace(widget.location.id),
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