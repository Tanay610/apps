import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/contacts/Widgets/contact_list.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "Contact",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: _buildAppbar(),
      body: Container(
          width: 360.w,
          height: 780.h,
          child: Center(
            child: ContactList(),
          )),
    );
  }
}
