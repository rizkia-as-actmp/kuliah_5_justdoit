import 'package:flutter/material.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_user_screen.dart';
import 'package:justdoit/src/common_widgets/loading_screen.dart';
import 'package:justdoit/src/common_widgets/splash_screen.dart';
import 'package:justdoit/src/constants/colors.dart';
import 'package:justdoit/src/features/activity/presentation/activities_screen.dart';
import 'package:justdoit/src/features/authentication/presentation/register/login_user_screen.dart';
import 'package:justdoit/src/features/authentication/presentation/register/register_complete_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DefinedTheme.background),
        useMaterial3: true,
      ),
      initialRoute: '/activities',
      routes: {
        '/': (context) => const RegisterUserScreen(),
        '/login': (context) => const LoginUserScreen(),
        '/registration-complete': (context) => const RegisterCompleteScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/splash': (context) => const SplashScreen(),
        '/activities': (context) => const ActivitiesScreen()
      },
    );
  }
}
