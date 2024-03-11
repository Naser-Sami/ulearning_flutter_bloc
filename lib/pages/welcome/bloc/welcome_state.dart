class WelcomeState {
  int page;
  WelcomeState({required this.page});
}

class InitialState extends WelcomeState {
  InitialState() : super(page: 0);
}