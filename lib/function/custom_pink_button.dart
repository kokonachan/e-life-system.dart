import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:flutter/material.dart';

class CustomPinkButton extends StatelessWidget {
  const CustomPinkButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.titlePadding = 0.0,
  });

  final String title;
  final void Function() onPressed;
  final double titlePadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorStyle.mainPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: titlePadding),
          child: Text(
            title,
            style: const TextStyle(
              color: ColorStyle.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
