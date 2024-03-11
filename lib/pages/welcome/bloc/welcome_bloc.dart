
import 'package:flutter_bloc/flutter_bloc.dart';

// files
import '/pages/welcome/bloc/welcome_event.dart';
import '/pages/welcome/bloc/welcome_state.dart';

class WelcomeBlocs extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBlocs() : super(InitialState()) {

    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });

  }
}