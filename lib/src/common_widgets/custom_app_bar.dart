import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/type.dart';
import 'package:justdoit/src/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:
          false, // NOTE: untuk menghilangkan back button pada leading
      //title: HeadingThree(data: "Activity"),
      actions: [
        mediumHSizedBox,
        HeadingThree(data: "Activity"),
        bigHSizedBox,
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: 640,
                  height: 40,
                  child: SearchBar(
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor:
                        WidgetStateProperty.all(DefinedTheme.primary50),
                    trailing: const [
                      Icon(
                        Icons.search,
                        color: DefinedTheme.primary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        mediumHSizedBox,
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: DefinedTheme.onBackground,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              color: DefinedTheme.onBackground,
            )),
        const SizedBox(width: 16),
        mediumHSizedBox,
      ],
    );
  }
}
