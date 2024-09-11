import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: SizedBox(
          height: 60,
          child: TextFormField(
            controller: controller,
            cursorColor: ColorStyle.mainGrey,
            cursorHeight: 17,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 20,
              ),
              hintText: '件名を入力してください',
              hintStyle: const TextStyle(
                color: ColorStyle.mainGrey,
                fontSize: 16,
              ),
              suffixIcon: Container(
                width: 50,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: ColorStyle.mainGrey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: ColorStyle.mainGrey,
                ),
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
    );
  }
}
