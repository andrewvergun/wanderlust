import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderlust/features/about_page/presentation/pages/about_page.dart';
import 'package:wanderlust/features/home_page/presentation/pages/home_page.dart';
import 'package:wanderlust/features/interactive_map_page/pages/interactive_map_page.dart';
import 'package:wanderlust/features/onboarding/presentation/pages/onboarding.dart';

final router = GoRouter(
  initialLocation: '/${OnboardingPage.path}',
  routes: [
    GoRoute(
      name: OnboardingPage.path,
      path: '/${OnboardingPage.path}',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: HomePage.path,
      path: '/${HomePage.path}',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: AboutPage.path,
      path: '/${AboutPage.path}',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      name: InteractiveMapPage.path,
      path: '/${InteractiveMapPage.path}',
      builder: (context, state) => const InteractiveMapPage(),
    ),
  ],
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding && state.uri.toString() == '/${OnboardingPage.path}') {
      return '/${HomePage.path}';
    }

    if (!hasSeenOnboarding && state.uri.toString() == '/${HomePage.path}') {
      return '/${OnboardingPage.path}';
    }

    return null;
  },
);