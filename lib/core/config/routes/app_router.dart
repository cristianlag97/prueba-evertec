part of core.routes;

final router = GoRouter(
  initialLocation: PAGES.login.screenPath,
  routes: [
    //! Login
    GoRoute(
      path: PAGES.login.screenPath,
      name: PAGES.login.screenName,
      builder: (context, state) => const LoginScreen(),
    ),
    //! Splash
    GoRoute(
      path: PAGES.splash.screenPath,
      name: PAGES.splash.screenName,
      builder: (context, state) => const SplashScreen(),
    ),
    //! Home
    GoRoute(
      path: PAGES.home.screenPath,
      name: PAGES.home.screenName,
      builder: (context, state) => const HomeScreen(),
    ),
    //! States
    GoRoute(
      path: PAGES.region.screenPath,
      name: PAGES.region.screenName,
      builder: (context, state) => const StatesScreen(),
    ),
    //! State Detail
    GoRoute(
      path: PAGES.details.screenPath,
      name: PAGES.details.screenName,
      builder: (context, state) {
        final String stateId = state.pathParameters['stateId'] ?? 'no-state';
        final String nameState = state.pathParameters['nameState'] ?? 'no-name';
        return StateDetailScreen(state: stateId, name: nameState);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
