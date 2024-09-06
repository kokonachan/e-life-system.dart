import 'package:e_life_system/common/color/color_style.dart';
import 'package:e_life_system/common/margin/height_margin.dart';
import 'package:e_life_system/feature/estimate_create/estimate_create_page.dart';
import 'package:e_life_system/feature/estimate_list/component/estimate_tile.dart';
import 'package:e_life_system/feature/estimate_list/component/item_title_text.dart';
import 'package:e_life_system/feature/estimate_list/component/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EstimateListPage extends HookConsumerWidget {
  const EstimateListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorStyle.white,
        shape: Border(
          bottom: BorderSide(
            color: ColorStyle.mainBlue.withOpacity(0.15),
            width: 1,
          ),
        ),
        leadingWidth: 400,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Image.asset(
              'assets/images/e-life-logo.png',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            HeightMargin.large,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '見積書一覧',
                  style: TextStyle(
                    color: ColorStyle.mainBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const EstimateCreatePage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorStyle.mainPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      '＋見積書を作成する',
                      style: TextStyle(
                        color: ColorStyle.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HeightMargin.medium,
            const Divider(
              color: ColorStyle.dividerGrey,
              height: 1,
            ),
            HeightMargin.medium,
            SearchTextFormField(controller: controller),
            HeightMargin.large,
            Row(
              children: [
                ItemTitleText(
                  title: 'ステータス',
                  width: size.width * 0.15,
                ),
                const Expanded(
                  child: ItemTitleText(title: '件名'),
                ),
                ItemTitleText(
                  title: '作成日',
                  width: size.width * 0.2,
                ),
                ItemTitleText(
                  title: '金額',
                  width: size.width * 0.2,
                ),
              ],
            ),
            HeightMargin.normal,
            const Divider(
              color: ColorStyle.mainGrey,
              height: 1,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                    EstimateTile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
