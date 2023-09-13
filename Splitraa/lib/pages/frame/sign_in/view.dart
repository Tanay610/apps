import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        "Splitra",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 45.sp,
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(String loginType, String logo) {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(bottom: 19.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              )
            ]),
        child: Row(
          /// conditional statement to check and give the output by using ? and :.
          mainAxisAlignment:
              logo == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            /// Have a look at this.
            logo == ''
                ? Container()
                : Container(
                    padding: EdgeInsets.only(left: 36.w, right: 29.w),
                    child: Image.asset("assets/icons/$logo.png"),
                  ),

            Container(
              child: Text(
                "Sign in with $loginType",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        controller.handleSignin("google");
      },
    );
  }

  Widget buildSignUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Text(
            "Already have an account.",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Sign up here",
              style: TextStyle(
                color: AppColors.primaryElement,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin("Google", "google"),
            _buildThirdPartyLogin("Facebook", "facebook"),
            _buildThirdPartyLogin("Apple", "apple"),
            _buildOrWidget(),
            _buildThirdPartyLogin("Phone Number", ""),
            SizedBox(
              height: 37.h,
            ),
            buildSignUpWidget(),
          ],
        ),
      ),
    );
  }
}

class _buildOrWidget extends StatelessWidget {
  const _buildOrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              indent: 40,
              height: 2.h,
              color: Colors.black,
            ),
          ),
          const Text("  Or  "),
          Expanded(
            child: Divider(
              endIndent: 40,
              height: 2.h,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
