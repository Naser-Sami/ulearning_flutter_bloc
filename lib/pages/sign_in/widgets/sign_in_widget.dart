import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() => AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withOpacity(0.50),
          height: 1.0,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Login",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );

// we need context to access the bloc
Widget buildThirdPartyLogin(BuildContext context) => Container(
      margin: EdgeInsets.only(top: 40.r, bottom: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _reusableIcons(icon: 'google'),
          _reusableIcons(icon: 'apple'),
          _reusableIcons(icon: 'facebook'),
        ],
      ),
    );

Widget _reusableIcons({required String icon}) => GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/$icon.png"),
      ),
    );

Widget reusableText(String text) => Container(
      margin: EdgeInsets.only(bottom: 5.r),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.80),
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );

Widget buildTextField(
        {required String hintText,
        required String textType,
        required String iconName}) =>
    Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                  fontFamily: 'Avenir'),
              autocorrect: false,
              obscureText: textType == 'password',
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.50)),

                // ***
                // Borders
                // ****
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget forgotPassword() => SizedBox(
      width: 260.w,
      height: 40.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp,
          ),
        ),
      ),
    );

Widget buildLoginAndRegisterButton(String text) => GestureDetector(
      onTap: () {},
      child: Container(
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
