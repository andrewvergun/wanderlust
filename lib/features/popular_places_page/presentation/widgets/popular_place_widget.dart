import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/forward_button.dart';
import '../../../interactive_map_page/data/models/location_data.dart';
import '../../../../config/theme/theme.dart';

class PopularPlaceWidget extends StatefulWidget {
  const PopularPlaceWidget({super.key, required this.location});
  final LocationData location;

  @override
  State<PopularPlaceWidget> createState() => _PopularPlaceWidgetState();
}

class _PopularPlaceWidgetState extends State<PopularPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
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
                          widget.location.name,
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
                              widget.location.description
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
                        context.goNamed(
                          'popular_place_expanded',
                          extra: widget.location,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}