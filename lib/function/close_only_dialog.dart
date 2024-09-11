import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/config/utils/margin/height_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

//閉じるだけのダイアログ
void showCloseOnlyDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const CloseOnlyDialog();
    },
  );
}

class CloseOnlyDialog extends StatelessWidget {
  const CloseOnlyDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 450,
        height: 270,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Image.asset(
                  'assets/images/e-life-logo.png',
                ),
              ),
              HeightMargin.normal,
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  'この機能は現在開発中です。\nもうしばらくお待ちください。',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ),
              HeightMargin.normal,
              Container(
                width: 250,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: ColorStyle.white,
                    backgroundColor: ColorStyle.mainGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '閉じる',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 200.ms, delay: 200.ms);
  }
}
