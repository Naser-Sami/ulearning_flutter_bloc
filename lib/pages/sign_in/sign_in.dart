import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_flutter_bloc/pages/sign_in/bloc/sing_in_event.dart';
import 'package:ulearning_flutter_bloc/pages/sign_in/sign_in_controller.dart';

import '/pages/sign_in/widgets/sign_in_widget.dart';
import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                    child: reusableText("Or use your email account to login"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.r),
                    padding: EdgeInsets.symmetric(horizontal: 25.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        buildTextField(
                          hintText: "Enter your email address",
                          textType: 'email',
                          iconName: 'user',
                          onChanged: (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Password"),
                        buildTextField(
                          hintText: "Enter your email password",
                          textType: 'password',
                          iconName: 'lock',
                          onChanged: (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        forgotPassword(),
                        buildLoginAndRegisterButton(
                          text: "Login",
                          buttonType: 'login',
                          func: () {
                            log("Login button");
                            SignInController(context: context).handelSignIn(type: "email");
                          },
                        ),
                        SizedBox(height: 16.h),
                        buildLoginAndRegisterButton(
                          text: "Register",
                          buttonType: 'register',
                          func: () {
                            log("Register button");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
