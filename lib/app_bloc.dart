
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_flutter_bloc/app_event.dart';
import 'package:ulearning_flutter_bloc/app_state.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(InitState()) {

    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
  }
}