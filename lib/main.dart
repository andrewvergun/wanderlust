import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wanderlust/features/onboarding/presentation/pages/onboarding.dart';
import 'package:go_router/go_router.dart';
import 'config/routes/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.black,


      ),
    );
  }
}
