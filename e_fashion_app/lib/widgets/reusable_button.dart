import 'package:flutter/material.dart';

class ReUsableButton extends StatelessWidget {
  const ReUsableButton({
    super.key,
    required this.text, required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: MaterialButton(
        onPressed: onTap,
        minWidth: size.width * 0.9,
        height: size.width * 0.15,
        color: Colors.blueGrey,
        child:  Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
