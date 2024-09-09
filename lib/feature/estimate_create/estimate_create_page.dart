import 'package:e_life_system/common/color/color_style.dart';
import 'package:e_life_system/common/margin/height_margin.dart';
import 'package:e_life_system/common/margin/width_margin.dart';
import 'package:e_life_system/feature/estimate_create/component/label_and_text_form_field.dart';
import 'package:e_life_system/feature/estimate_create/component/page_title_text.dart';
import 'package:e_life_system/feature/estimate_create/component/table_item_title.dart';
import 'package:e_life_system/feature/estimate_create/component/table_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EstimateCreatePage extends HookConsumerWidget {
  const EstimateCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final TextEditingController controller = useTextEditingController();

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Row(
                children: [
                  Icon(Icons.close_rounded),
                  Text(
                    '閉じる',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorStyle.mainBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    HeightMargin.large,
                    const PageTitleText(title: '見積情報'),
                    LabelAndTextFormField(
                      controller: controller,
                      title: '見積件名',
                      isRequired: true,
                      maxLength: 50,
                    ),
                    LabelAndTextFormField(
                      controller: controller,
                      title: '施行期日',
                      counterText: '',
                      isRequired: true,
                    ),
                    LabelAndTextFormField(
                      controller: controller,
                      title: '見積有効期間',
                      counterText: '',
                    ),
                    LabelAndTextFormField(
                      controller: controller,
                      title: '見積番号',
                      maxLength: 20,
                    ),
                    HeightMargin.large,
                    const PageTitleText(title: '見積内容'),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(1.5),
                        4: FlexColumnWidth(1.5),
                      },
                      border: TableBorder.all(
                        color: ColorStyle.dividerGrey,
                        width: 1,
                      ),
                      children: [
                        const TableRow(
                          children: [
                            TableItemTitle(title: '名称'),
                            TableItemTitle(title: '数量'),
                            TableItemTitle(title: '単位'),
                            TableItemTitle(title: '単価'),
                            TableItemTitle(title: '金額'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(
                              controller: controller,
                              isReadOnly: true,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(
                              controller: controller,
                              isReadOnly: true,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(controller: controller),
                            TableTextFormField(
                              controller: controller,
                              isReadOnly: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: ColorStyle.mainGrey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '＋行を追加',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorStyle.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(3), // 最初の列は2倍の幅
                            1: FlexColumnWidth(2), // 2番目の列は固定幅40
                          },
                          border: TableBorder.all(
                            color: ColorStyle.dividerGrey,
                            width: 1,
                          ),
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Center(
                                    child: Text(
                                      '小計',
                                      style: TextStyle(
                                        color: ColorStyle.mainBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('3,000'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Center(
                                    child: Text(
                                      '消費税(10％)',
                                      style: TextStyle(
                                        color: ColorStyle.mainBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('3,000'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Center(
                                    child: Text(
                                      '合計',
                                      style: TextStyle(
                                        color: ColorStyle.mainBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  color: ColorStyle.white,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('3,000'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    HeightMargin.large,
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: size.width,
            color: ColorStyle.backGroundGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 60,
                    color: ColorStyle.white,
                    child: const Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '合計金額',
                            style: TextStyle(
                              color: ColorStyle.mainBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidthMargin.xLarge,
                          Text(
                            '300,000',
                            style: TextStyle(
                              color: ColorStyle.mainBlack,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidthMargin.mini,
                          Text(
                            '円',
                            style: TextStyle(
                              color: ColorStyle.mainBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorStyle.mainPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 72.0),
                        child: Text(
                          '保存',
                          style: TextStyle(
                            color: ColorStyle.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
