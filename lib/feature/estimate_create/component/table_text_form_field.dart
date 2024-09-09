import 'package:e_life_system/common/color/color_style.dart';
import 'package:flutter/material.dart';

class TableTextFormField extends StatelessWidget {
  const TableTextFormField({
    super.key,
    required this.controller,
    this.isReadOnly = false,
  });

  final TextEditingController controller;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: ColorStyle.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (isReadOnly)
            ? const Align(
                alignment: Alignment.centerRight,
                child: Text('3,000'),
              )
            : TextFormField(
                controller: controller,
                cursorColor: ColorStyle.grey,
                cursorHeight: 17,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorStyle.lightGrey,
                  contentPadding: const EdgeInsets.only(
                    left: 8,
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
                      color: ColorStyle.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
      ),
    );
  }
}
