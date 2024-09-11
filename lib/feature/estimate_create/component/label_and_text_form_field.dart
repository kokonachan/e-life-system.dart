import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/config/utils/margin/height_margin.dart';
import 'package:e_life_system/config/utils/margin/width_margin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LabelAndTextFormField extends StatelessWidget {
  const LabelAndTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.maxLength,
    this.counterText,
    this.isRequired,
    this.isReadOnly = false,
  });

  final String title;
  final bool? isRequired;
  final String? counterText;
  final int? maxLength;
  final TextEditingController controller;
  final bool isReadOnly;

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
                readOnly: isReadOnly,
                onTap: () async {
                  if (isReadOnly) {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      locale: const Locale('ja'),
                      initialDatePickerMode: DatePickerMode.day,
                      initialDate: DateTime.now(), // 最初に表示する日付
                      firstDate: DateTime.now(), // 選択できる日付の最小値
                      lastDate: DateTime(2100), // 選択できる日付の最大値
                      builder: (context, child) {
                        //コンテンツにpaddingを追加
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: ColorStyle.mainBlue,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    ColorStyle.mainBlack, // ボタンのテキスト
                              ),
                            ),
                            datePickerTheme: DatePickerThemeData(
                              dayBackgroundColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return ColorStyle.mainBlue
                                      .withOpacity(0.45); // 選択された日付の背景色
                                }
                                return null;
                              }),
                              todayBackgroundColor: WidgetStateProperty.all(
                                  ColorStyle.mainBlue.withOpacity(0.1)),
                              todayBorder: const BorderSide(
                                  color: ColorStyle.mainBlue, width: 1),
                              dayOverlayColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return ColorStyle.mainBlue
                                      .withOpacity(0.2); // ホバー時の色
                                }
                                return null;
                              }),
                              dayForegroundColor:
                                  WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.white; // 選択された日付のテキスト色
                                }
                                return null;
                              }),
                              todayForegroundColor:
                                  WidgetStateProperty.all(ColorStyle.mainBlue),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (picked != null) {
                      controller.text = DateFormat('yyyy/MM/dd').format(picked);
                    }
                  }
                },
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
