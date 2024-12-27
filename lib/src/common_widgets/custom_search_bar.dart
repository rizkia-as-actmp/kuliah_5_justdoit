import 'package:flutter/material.dart';
import 'package:justdoit/src/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 640,
        height: 40,
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
      ),
    );
  }
}
