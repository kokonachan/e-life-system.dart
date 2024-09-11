import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:flutter/material.dart';

class TableTextFormField extends StatelessWidget {
  const TableTextFormField({
    super.key,
    required this.controller,
    this.isReadOnly = false,
    this.totalAmount,
    this.onChanged,
  });

  final TextEditingController controller;
  final bool isReadOnly;
  final int? totalAmount;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: ColorStyle.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (isReadOnly)
            ? Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalAmount!.toString(),
                  style: const TextStyle(
                    color: ColorStyle.mainBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : TextFormField(
                controller: controller,
                cursorColor: ColorStyle.grey,
                cursorHeight: 17,
                onChanged: onChanged,
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
