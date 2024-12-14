import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text.dart';
import 'package:justdoit/src/constants/colors.dart';

// NOTE: Gunakan ConsumerWidget sebagai pengganti StatelessWidget, seperti yang disediakan oleh Riverpod.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //NOTE: Dengan "ref.read" dan "myProvider.notifier", kita bisa mendapatkan instance kelas notifer untuk memanggil metode "addTodo".
    //final  auth = ref.read(authRepositoryProvider.notifier);
    // final tescols = ref.watch(getTestColsProvider);
    //print(tescols);
    //
    // HeadingOne(
    //     data: switch (tescols) {
    //   AsyncData(:final value) => 'Activity: $value',
    //   AsyncError() => 'Oops, something unexpected happened',
    //   _ => 'tunggu....',
    // });

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
            HeadingOne(data: "JustDoIT")
          ],
        ),
      ),
    );
  }
}
