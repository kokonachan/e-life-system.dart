import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalMoneyTableRow extends StatelessWidget {
  const TotalMoneyTableRow({
    super.key,
    required this.label,
    required this.result,
  });

  final String label; // ラベルのタイトル
  final int result; // ラベルの結果

  // カスタムメソッドで TableRow を返す
  TableRow toTableRow() {
    final formatter = NumberFormat('#,###');
    final formattedResult = formatter.format(result);

    return TableRow(
      children: [
        Container(
          height: 50,
          color: ColorStyle.white,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: ColorStyle.mainBlack,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          color: ColorStyle.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '¥$formattedResult',
                style: const TextStyle(
                  color: ColorStyle.mainBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // ここでは何も表示しない
    return const SizedBox.shrink();
  }
}
