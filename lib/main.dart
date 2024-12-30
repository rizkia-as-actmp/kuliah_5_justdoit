import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/features/authentication/data/shared_preferences_repository.dart';
import 'package:justdoit/src/features/authentication/presentation/password_reset/password_reset_screen.dart';
import 'package:justdoit/src/features/authentication/presentation/otp/otp_screen.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_user_screen.dart';
import 'package:justdoit/src/common_widgets/loading_screen.dart';
import 'package:justdoit/src/common_widgets/splash_screen.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/authentication/presentation/login/login_user_screen.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_complete_screen.dart';
import 'package:justdoit/src/features/mark/presentation/editor/mark_editor_screen.dart';
import 'package:justdoit/src/features/mark/presentation/list/mark_list_screen.dart';
import 'package:justdoit/src/features/mark/presentation/viewer/mark_viewer.dart';

void main() {
  //Untuk membuat widget dapat membaca provider, kita perlu membungkus seluruh aplikasi dengan widget "ProviderScope". Di sinilah state dari provider kita disimpan.
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class _RiverpodEagerInitialization extends ConsumerWidget {
  const _RiverpodEagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // dart tidak memungkian bagi riverpod prodiver untuk melakukan Eagerly initialization, alternatifnya kita harus force read provider agar ter init di awal
    ref.watch(otpIdSharedPrefRepositoryProvider);
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _RiverpodEagerInitialization(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DefinedTheme.greyish),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/mark-list': (context) => const MarkListScreen(),
        '/mark-viewer': (context) => const MarkViewerScreen(),
        '/mark-editor': (context) => const MarkEditorScreen(),
        '/user-password-reset': (context) => const PasswordResetScreen(),
        '/register-user': (context) => const RegisterUserScreen(),
        '/login': (context) => const LoginUserScreen(),
        '/verify-otp': (context) => const InputOtpScreen(),
        '/registration-complete': (context) => const RegisterCompleteScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/splash': (context) => const SplashScreen(),
      },
    ));
  }
}
