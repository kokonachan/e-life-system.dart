import 'package:e_life_system/common/color/color_style.dart';
import 'package:e_life_system/common/margin/height_margin.dart';
import 'package:e_life_system/common/margin/width_margin.dart';
import 'package:flutter/material.dart';

class LabelAndTextFormField extends StatelessWidget {
  const LabelAndTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.maxLength,
    this.counterText,
    this.isRequired,
  });

  final String title;
  final bool? isRequired;
  final String? counterText;
  final int? maxLength;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: counterText == '' ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ColorStyle.mainBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WidthMargin.small,
              if (isRequired != null)
                Container(
                  decoration: BoxDecoration(
                    color: ColorStyle.mainPink,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '必須',
                      style: TextStyle(
                        color: ColorStyle.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          HeightMargin.small,
          FractionallySizedBox(
            widthFactor: 0.5,
            child: SizedBox(
              height: counterText == '' ? 40 : 60,
              child: TextFormField(
                maxLength: maxLength,
                controller: controller,
                cursorColor: ColorStyle.mainGrey,
                cursorHeight: 17,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 20,
                  ),
                  counterText: counterText,
                  counterStyle: const TextStyle(
                    fontSize: 13,
                    color: ColorStyle.mainGrey,
                  ),
                  // 選択されたときの枠線の色
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorStyle.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // 選択されていないときの枠線の色
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorStyle.mainGrey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
