// Custom list tile definition
import 'package:flutter/material.dart';
import 'package:admin/src/main_index.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading; // Optional leading widget
  final Text? title; // Required title text
  final Text? subTitleLeading; // Optional subtitle text
  final Text? subTitle; // Optional subtitle text
  final Function? onTap; // Optional tap event handler
  final Function? onLongPress; // Optional long press event handler
  final Function? onDoubleTap; // Optional double tap event handler
  final Widget? trailing; // Optional trailing widget
  final Color? tileColor; // Optional tile background color
  final double? height; // Required height for the custom list tile

  // Constructor for the custom list tile
  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subTitleLeading,
    this.subTitle,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.trailing,
    this.tileColor,
    required this.height, // Make height required for clarity
  });

  @override
  Widget build(BuildContext context) {
    return Material( // Material design container for the list tile
      color: tileColor ?? context.cardColor, // Set background color if provided
      child: InkWell( // Tappable area with event handlers
        onTap: () => onTap, // Tap event handler
        onDoubleTap: () => onDoubleTap, // Double tap event handler
        onLongPress: () => onLongPress, // Long press event handler
        child: SizedBox( // Constrain the size of the list tile
          height: height, // Set custom height from constructor
          child: Row( // Row layout for list item content
            crossAxisAlignment: CrossAxisAlignment.start, // Align children vertically
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children vertically
                    children: [
                      Row(
                        children: [
                          leading ?? const SizedBox.shrink(), // Display leading widget or empty space
                          Expanded( // Expanded section for title and subtitle
                            child: Column( // Column layout for title and subtitle
                              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                              children: [
                                title ?? const SizedBox(), // Display title or empty space
                                const SizedBox(height: 10), // Spacing between title and subtitle
                                subTitleLeading ?? const SizedBox.shrink(), // Display subtitle or empty space
                              ],
                            ),
                          ),
                        ],
                      ),
                      subTitle ?? const SizedBox(), // Display subtitle or empty space
                    ],
                  ),
                ),
              ),
              Padding( // Padding for the trailing widget
                padding: const EdgeInsets.all(12.0),
                child: trailing, // Display trailing widget
              )
            ],
          ),
        ),
      ),
    );
  }
}