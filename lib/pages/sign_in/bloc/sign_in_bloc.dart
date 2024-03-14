import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/pages/sign_in/bloc/sign_in_state.dart';
import '/pages/sign_in/bloc/sing_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    log('email ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    log('password ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
