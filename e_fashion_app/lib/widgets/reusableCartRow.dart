import 'package:e_fashion_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReusableCartForRow extends StatelessWidget {
  const ReusableCartForRow({super.key, required this.price, required this.text});

  final double price;
  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: textTheme.headline5?.copyWith(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        ReUsableTextForDetails(text: price.toString(),
        ),
      ],),
    );
  }
}
