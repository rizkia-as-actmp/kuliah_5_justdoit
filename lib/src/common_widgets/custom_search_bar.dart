import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate maxWidth dynamically
    final maxWidth = screenWidth * 0.45; // For example, scale by 10% of screen width
    final constrainedWidth = maxWidth.clamp(0.0, 640.0); // Clamp to a maximum value

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: constrainedWidth,
        maxHeight: 40,
      ),
      child: SearchBar(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(DefinedTheme.primary50),
        trailing: const [
          Icon(
            Icons.search,
            color: DefinedTheme.primary,
          )
        ],
      ),
    );
  }
}
