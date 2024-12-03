import 'package:flutter/material.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text.dart';
import 'package:justdoit/src/constants/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: DefinedTheme.onBackground,
              strokeWidth: 6,
            ),
            bigVSizedBox,
            HeadingOne(data: "JustWait")
          ],
        ),
      ),
    );
  }
}
