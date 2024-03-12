import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
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
                    ),
                    reusableText("Password"),
                    buildTextField(
                      hintText: "Enter your email password",
                      textType: 'password',
                      iconName: 'lock',
                    ),
                    forgotPassword(),
                    buildLoginAndRegisterButton("Login", 'login'),
                    SizedBox(height: 16.h),
                    buildLoginAndRegisterButton("Register", 'register'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
