import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/common_widgets/custom_sized_box.dart';
import 'package:justdoit/src/common_widgets/custom_text.dart';
import 'package:justdoit/src/common_widgets/show_excep_dialog.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/authentication/application/auth_providers.dart';

// NOTE: Gunakan ConsumerWidget sebagai pengganti StatelessWidget, seperti yang disediakan oleh Riverpod.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void _loadAndPush() async {
    final authState = ref.watch(authProvider);

    await Future.delayed(Duration(seconds: 2));

    await authState.when(
        data: (token) async {
          if (token != null) {
            //Navigator.pushReplacementNamed(context, '/mark-list');
            Navigator.pushNamed(context,
                '/mark-list'); // ketika menggunakan replacement auth menghilang
          } else {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        error: (error, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showExceptionDialog(context, error);
            ref.invalidate(authProvider);
          });
        },
        loading: () {});
  }

  @override
  Widget build(BuildContext context) {
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

    // Fungsi microtask dieksekusi setelah tugas sinkron selesai, tetapi sebelum event loop menjalankan tugas-tugas lainnya.
    Future.microtask(_loadAndPush);

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
            HeadingOne(data: "MarkDawg")
          ],
        ),
      ),
    );
  }
}
