import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/config/utils/margin/height_margin.dart';
import 'package:flutter/material.dart';

class PageTitleText extends StatelessWidget {
  const PageTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorStyle.mainBlack,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        HeightMargin.small,
        const Divider(
          color: ColorStyle.dividerGrey,
          height: 1,
        ),
        HeightMargin.medium,
      ],
    );
  }
}
