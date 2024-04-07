part of core.routes;

enum PAGES {
  splash,
  login,
  home,
  region,
  details,
  error,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return '/splash';
      case PAGES.region:
        return '/region';
      case PAGES.details:
        return '/details/:stateId/:nameState';
      case PAGES.error:
        return '/error';
      case PAGES.login:
        return '/login';
      case PAGES.home:
      default:
        return '/';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return 'SPLASH';
      case PAGES.login:
        return 'LOGIN';
      case PAGES.region:
        return 'REGION';
      case PAGES.details:
        return 'DETAILS';
      case PAGES.error:
        return 'ERROR';
      case PAGES.home:
      default:
        return 'HOME';
    }
  }
}
