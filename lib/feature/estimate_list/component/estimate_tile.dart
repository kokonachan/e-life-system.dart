import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/config/utils/margin/width_margin.dart';
import 'package:e_life_system/feature/estimate_list/data/estimate_data.dart';
import 'package:e_life_system/function/close_only_dialog.dart';
import 'package:flutter/material.dart';

class EstimateTile extends StatelessWidget {
  const EstimateTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showCloseOnlyDialog(context);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.15,
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: (index > 4) ? ColorStyle.green : ColorStyle.grey,
                        size: 20,
                      ),
                      WidthMargin.mini,
                      Text(
                        (index > 4) ? '送信済み' : '未送信',
                        style: const TextStyle(
                          color: ColorStyle.mainBlack,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title[index],
                        style: const TextStyle(
                          color: ColorStyle.mainBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '見積書番号：000${index + 1}',
                        style: const TextStyle(
                          color: ColorStyle.mainGrey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                  child: Text(
                    createdAt[index],
                    style: const TextStyle(
                      color: ColorStyle.mainBlack,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      price[index],
                      style: const TextStyle(
                        color: ColorStyle.mainBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: ColorStyle.mainGrey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
