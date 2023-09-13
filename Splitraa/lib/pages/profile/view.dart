import 'package:chatty/common/style/color.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../frame/welcome/controller.dart';
import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryText,
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(60.w),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/account_header.png")),
        ),
        Positioned(
          right: 0.w,
          top: 75.w,
          child: GestureDetector(
            child: Container(
              height: 30.w,
              width: 30.w,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
              ),
              child: Image(
                image: AssetImage("assets/icons/edit.png"),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCompleteButton() {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(top: 55.h, ),
          width: 295.w,
          height: 45.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(5.w),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 1),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Complete",
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(top: 45.h, bottom: 30.h),
          width: 295.w,
          height: 45.h,
          decoration: BoxDecoration(
              color: AppColors.primarySecondaryElementText,
              borderRadius: BorderRadius.all(
                Radius.circular(5.w),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 1),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )),
      onTap: () {
        Get.defaultDialog(
          title: "Are you sure to log out.",
          content: Container(),
          onConfirm: () {
            controller.goLogout();
          },
          onCancel: () {},
          textConfirm: "Confirm",
          textCancel: "Cancel",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(children: [
                    _buildProfilePhoto(),
                    _buildCompleteButton(),
                    _buildLogoutButton(),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
