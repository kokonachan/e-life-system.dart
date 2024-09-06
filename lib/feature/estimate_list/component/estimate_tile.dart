import 'package:e_life_system/common/color/color_style.dart';
import 'package:e_life_system/common/margin/width_margin.dart';
import 'package:flutter/material.dart';

class EstimateTile extends StatelessWidget {
  const EstimateTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: const Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: ColorStyle.green,
                      size: 20,
                    ),
                    WidthMargin.mini,
                    Text(
                      '送信済み',
                      style: TextStyle(
                        color: ColorStyle.mainBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '混合水栓修理工事',
                      style: TextStyle(
                        color: ColorStyle.mainBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '見積書番号：0001',
                      style: TextStyle(
                        color: ColorStyle.mainGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.2,
                child: const Text(
                  '2024/10/30',
                  style: TextStyle(
                    color: ColorStyle.mainBlack,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.2,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '300,000円',
                    style: TextStyle(
                      color: ColorStyle.mainBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
    );
  }
}
