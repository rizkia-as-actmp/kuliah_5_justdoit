import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_app_bar.dart';
import 'package:justdoit/src/common_widgets/custom_search_bar.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/type.dart';

class MarkListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarkListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leftRowWidgets: [HeadingThree(data: "Markdown Editor")],
      rightRowWidgets: [
        CustomSearchBar(),
        mediumHSizedBox,
        IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.account_circle_outlined)),
      ],
    );
  }
}
