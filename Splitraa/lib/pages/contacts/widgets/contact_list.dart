import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/common/entities/contact.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/contacts/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({super.key});

  Widget _buildListItem(ContactItem item) {
    return Container(
      padding: EdgeInsets.only(top: 8.w),
      decoration: const BoxDecoration(
          border: Border(
        bottom:
            BorderSide(width: 1, color: AppColors.primarySecondaryBackground),
      )),
      child: InkWell(
        onTap: () {
          controller.goChat(item);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.w)),
                  color: AppColors.primarySecondaryBackground,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1)),
                  ]),
              child: CachedNetworkImage(
                imageUrl: item.avatar!,
                height: 44.w,
                width: 44.w,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22.w)),
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
              ),
            ),
            Container(
              width: 275.w,
              padding: EdgeInsets.only(top: 10.w, left: 10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 42.w,
                      child: Text(
                        "${item.name}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.thirdElement,
                            fontSize: 16.sp,
                            fontFamily: "Avenir"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.w),
                      width: 12.w,
                      height: 12.w,
                      child: Image.asset("assets/icons/ang.png"),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 17.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = controller.state.contactList[index];
                return _buildListItem(item);
              }, childCount: controller.state.contactList.length),
            ),
          )
        ],
      );
    });

    /// we use obx becoz it will aoto update the UI.
  }
}
