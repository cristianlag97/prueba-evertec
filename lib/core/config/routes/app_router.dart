part of core.routes;

final router = GoRouter(
  routes: [
    //! Splash
    GoRoute(
      path: PAGES.splash.screenPath,
      name: PAGES.splash.screenName,
      builder: (context, state) => const SplashScreen(),
    ),
    //! Home
    // GoRoute(
    //   path: PAGES.home.screenPath,
    //   name: PAGES.home.screenName,
    //   builder: (context, state) => const HomeScreen(),
    // ),
    // GoRoute(
    //   path: PAGES.login.screenPath,
    //   name: PAGES.login.screenName,
    //   builder: (context, state) => const LoginScreen(),
    // ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
