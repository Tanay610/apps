import 'package:e_fashion_app/data/app_data.dart';
import 'package:e_fashion_app/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:advance_notification/advance_notification.dart';

class AddToCart {
  static void addToCart(BaseModel data, BuildContext context) {
    /// this variable save as a true or false value
    bool contains = itemsOncart.contains(data);

    if (contains == true) {
      /// data available on list
      const AdvanceSnackBar(
        textSize: 14.0,
        bgColor: Colors.red,
        message: 'You have added this item to cart before',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      itemsOncart.add(data);
      const AdvanceSnackBar(
        textSize: 14.0,
        message: 'Successfully added to your cart',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }
}
