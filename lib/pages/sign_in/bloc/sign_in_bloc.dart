import 'package:flutter_bloc/flutter_bloc.dart';

import '/pages/sign_in/bloc/sign_in_state.dart';
import '/pages/sign_in/bloc/sing_in_event.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInBloc() : super(const SingInState()) {

    on<EmailEvent>((event, emil) {

    });

    on<PasswordEvent>((event, emil) {

    });

  }
}
