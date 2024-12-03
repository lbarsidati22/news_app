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
