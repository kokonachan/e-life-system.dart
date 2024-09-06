import 'package:e_life_system/common/color/color_style.dart';
import 'package:flutter/material.dart';

class ItemTitleText extends StatelessWidget {
  const ItemTitleText({
    super.key,
    required this.title,
    this.width,
  });

  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0,
      child: Align(
        alignment: title == '金額' ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: ColorStyle.mainGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
