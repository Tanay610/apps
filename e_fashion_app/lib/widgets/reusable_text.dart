import 'package:flutter/material.dart';

import '../model/base_model.dart';
import 'package:e_fashion_app/utils/constants.dart';

class ReUsableTextForDetails extends StatelessWidget {
  const ReUsableTextForDetails({
    super.key,
    required this.text,

  });

  final String text;
  

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
          text: "€",
          style: textTheme.titleSmall?.copyWith(
            fontSize: 21,
            color: primarColor,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: text,
              style: textTheme.titleSmall?.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
    );
  }
}
