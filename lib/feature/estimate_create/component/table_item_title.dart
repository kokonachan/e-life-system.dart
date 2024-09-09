import 'package:e_life_system/common/color/color_style.dart';
import 'package:flutter/material.dart';

class TableItemTitle extends StatelessWidget {
  const TableItemTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: ColorStyle.backGroundGrey,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 11.0),
          child: Text(
            title,
            style: const TextStyle(
              color: ColorStyle.mainBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
