abstract class TestNewsState {}

class TestInitialState extends TestNewsState {}

class TestNavBarState extends TestNewsState {}

class TestBusunesLeadingSatete extends TestNewsState {}

class TestBusunesSuccunseSatete extends TestNewsState {}

class TestBusunesErrorSatete extends TestNewsState {
  String error;
  TestBusunesErrorSatete({
    required this.error,
  });
}

class TestSportsLeadingSatete extends TestNewsState {}

class TestSportsSuccunseSatete extends TestNewsState {}

class TestSportsErrorSatete extends TestNewsState {
  String error;
  TestSportsErrorSatete({
    required this.error,
  });
}

class TestSeinanceLeadingSatete extends TestNewsState {}

class TestSeinanceSuccunseSatete extends TestNewsState {}

class TestSeinanceErrorSatete extends TestNewsState {
  String error;
  TestSeinanceErrorSatete({
    required this.error,
  });
}
