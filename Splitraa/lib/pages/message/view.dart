import 'package:chatty/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../frame/welcome/controller.dart';
import 'controller.dart';


class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  ///slivers
  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  child: Container(
                      width: 44.h,
                      height: 44.h,
                      decoration: BoxDecoration(
                          color: AppColors.primarySecondaryBackground,
                          borderRadius: BorderRadius.all(Radius.circular(22.h)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            )
                          ]),

                      /// conditional statement needed to be checked
                      child: controller.state.headdetail.value.avatar == null
                          ? const Image(
                              image: AssetImage(
                                  "assets/images/account_header.png"),
                            )
                          : const Text("Hii")),
                  onTap: () {
                    controller.goProfile();
                  },
                ),
                Positioned(
                    bottom: 5.w,
                    right: 0.w,
                    child: Container(
                      height: 14.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.w,
                          color: AppColors.primaryElementText,
                        ),
                        color: AppColors.primaryElementStatus,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.w),
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.message),
      focusColor: Colors.red,
      autofocus: true,
      splashColor: Colors.red,
      
      onPressed: () {
      controller.goContact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: _headBar(),
            ),

            /// sliver are scrollable automatically soto make this one fixed we are using pinned true so it gets fixed
          ],
        ),

        Positioned(
          top: 500,
          right: 20,

          child: ActionButton()),
      ],
    )),
  
    );
    
  }
}
