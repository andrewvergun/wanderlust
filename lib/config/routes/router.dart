import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderlust/features/about_page/presentation/pages/about_page.dart';
import 'package:wanderlust/features/home_page/presentation/pages/home_page.dart';
import 'package:wanderlust/features/interactive_map_page/presentation/pages/interactive_map_page.dart';
import 'package:wanderlust/features/interesting_facts_page/pages/interesting_facts_page.dart';
import 'package:wanderlust/features/interesting_facts_page/pages/facts_display_page.dart';
import 'package:wanderlust/features/onboarding/presentation/pages/onboarding.dart';
import 'package:wanderlust/features/popular_places_page/presentation/pages/popular_places_page.dart';
import 'package:wanderlust/features/saved_places_page/pages/saved_places_page.dart';
import '../../features/interactive_map_page/data/models/location_data.dart';
import '../../features/popular_places_page/presentation/pages/popular_place_expanded_page.dart';
import '../../common/animations/page_transition.dart';

final router = GoRouter(
  initialLocation: '/${OnboardingPage.path}',
  routes: [
    GoRoute(
      name: OnboardingPage.path,
      path: '/${OnboardingPage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const OnboardingPage(),
        state: state,
      ),
    ),
    GoRoute(
      name: HomePage.path,
      path: '/${HomePage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const HomePage(),
        state: state,
      ),
    ),
    GoRoute(
      name: AboutPage.path,
      path: '/${AboutPage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const AboutPage(),
        state: state,
      ),
    ),
    GoRoute(
      name: InteractiveMapPage.path,
      path: '/${InteractiveMapPage.path}',
      pageBuilder: (context, state) {
        final LocationData? selectedLocation = state.extra as LocationData?;
        return buildFadeThroughPage(
          child: InteractiveMapPage(selectedLocation: selectedLocation),
          state: state,
        );
      },
    ),
    GoRoute(
      name: PopularPlacesPage.path,
      path: '/${PopularPlacesPage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const PopularPlacesPage(),
        state: state,
      ),
    ),
    GoRoute(
      name: 'popular_place_expanded',
      path: '/${PopularPlaceExpandedPage.path}',
      pageBuilder: (context, state) {
        final LocationData location = state.extra as LocationData;
        return buildFadeThroughModalPage(
          child: PopularPlaceExpandedPage(location: location),
          state: state,
        );
      },
    ),
    GoRoute(
      name: SavedPlacesPage.path,
      path: '/${SavedPlacesPage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const SavedPlacesPage(),
        state: state,
      ),
    ),
    GoRoute(
      name: InterestingFactsPage.path,
      path: '/${InterestingFactsPage.path}',
      pageBuilder: (context, state) => buildFadeThroughPage(
        child: const InterestingFactsPage(),
        state: state,
      ),
    ),
    GoRoute(
      name: FactsDisplayPage.path,
      path: '/${FactsDisplayPage.path}',
      pageBuilder: (context, state) {
        final String categoryName = state.extra as String;
        return buildFadeThroughPage(
          child: FactsDisplayPage(categoryName: categoryName),
          state: state,
        );
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
