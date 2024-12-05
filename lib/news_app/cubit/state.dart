abstract class NewsStats {}

class NewsInitiaiState extends NewsStats {}

class NewsBottomNavState extends NewsStats {}

class NewsGetBusinusLeadingState extends NewsStats {}

class NewsGetBusinusSuccecsState extends NewsStats {}

class NewsGetBusinusErrotState extends NewsStats {
  final String? error;
  NewsGetBusinusErrotState({
    this.error,
  });
}

class NewsGetSportsLeadingState extends NewsStats {}

class NewsGetSportsSuccecsState extends NewsStats {}

class NewsGetSportsErrotState extends NewsStats {
  final String? error;
  NewsGetSportsErrotState({
    this.error,
  });
}

class NewsGetSeinanceLeadingState extends NewsStats {}

class NewsGetSeinanceSuccecsState extends NewsStats {}

class NewsGetSeinanceErrotState extends NewsStats {
  final String? error;
  NewsGetSeinanceErrotState({
    this.error,
  });
}

class NewsGetSearchLeadingState extends NewsStats {}

class NewsGetSearchSuccecsState extends NewsStats {}

class NewsGetSearchErrotState extends NewsStats {
  final String? error;
  NewsGetSearchErrotState({
    this.error,
  });
}

class NewsDarkModeState extends NewsStats {}
