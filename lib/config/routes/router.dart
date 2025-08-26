import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderlust/features/about_page/presentation/pages/about_page.dart';
import 'package:wanderlust/features/home_page/presentation/pages/home_page.dart';
import 'package:wanderlust/features/interactive_map_page/presentation/pages/interactive_map_page.dart';
import 'package:wanderlust/features/onboarding/presentation/pages/onboarding.dart';
import 'package:wanderlust/features/popular_places_page/presentation/pages/popular_places_page.dart';

import '../../features/interactive_map_page/data/models/location_data.dart';
import '../../features/popular_places_page/presentation/pages/popular_place_expanded_page.dart';

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
    GoRoute(
      name: PopularPlacesPage.path,
      path: '/${PopularPlacesPage.path}',
      builder: (context, state) => const PopularPlacesPage(),
    ),
    GoRoute(
      name: PopularPlaceExpandedPage.path,
      path: '/${PopularPlaceExpandedPage.path}',
      builder: (context, state) {
        final LocationData location = state.extra as LocationData;
        return PopularPlaceExpandedPage(location: location);
      },
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