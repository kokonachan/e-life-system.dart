import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/config/utils/margin/height_margin.dart';
import 'package:e_life_system/config/utils/margin/width_margin.dart';
import 'package:e_life_system/feature/estimate_create/component/label_and_text_form_field.dart';
import 'package:e_life_system/feature/estimate_create/component/page_title_text.dart';
import 'package:e_life_system/feature/estimate_create/component/table_item_title.dart';
import 'package:e_life_system/feature/estimate_create/component/table_text_form_field.dart';
import 'package:e_life_system/feature/estimate_create/component/total_money_table_row.dart';
import 'package:e_life_system/feature/pdf/pdf_creater.dart';
import 'package:e_life_system/feature/storage/controller/storage_controller.dart';
import 'package:e_life_system/function/custom_pink_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class EstimateCreatePage extends HookConsumerWidget {
  const EstimateCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final TextEditingController titleController =
        useTextEditingController(); //見積もり件名
    final TextEditingController doDateController =
        useTextEditingController(); //施行期日
    final TextEditingController validPeriodController =
        useTextEditingController(); //見積有効期間
    final TextEditingController estimateNumberController =
        useTextEditingController(); //見積番号

    final ValueNotifier<List<List<TextEditingController>>> controllers =
        useState([]);
    final totalAmounts = useState<List<int>>([]);

    // 小計、消費税、合計を計算するValueNotifier
    final ValueNotifier<int> subtotal = useState(0);
    final ValueNotifier<int> tax = useState(0);
    final ValueNotifier<int> total = useState(0);

    useEffect(() {
      controllers.value = [_createNewRow()];
      totalAmounts.value = [0];
      return null;
    }, []);

    // totalAmountsが変更されるたびに小計、消費税、合計を再計算
    useEffect(() {
      subtotal.value = _calculateTotalAmount(totalAmounts.value);
      tax.value = _calculateTax(subtotal.value, 0.1);
      total.value = subtotal.value + tax.value;

      return null;
    }, [totalAmounts.value]);

    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        toolbarHeight: 80,
        surfaceTintColor: ColorStyle.white,
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
                      controller: titleController,
                      title: '見積件名',
                      isRequired: true,
                      maxLength: 50,
                    ),
                    LabelAndTextFormField(
                      controller: doDateController,
                      title: '施行期日',
                      counterText: '',
                      isRequired: true,
                    ),
                    LabelAndTextFormField(
                      controller: validPeriodController,
                      title: '見積有効期間',
                      counterText: '',
                    ),
                    LabelAndTextFormField(
                      controller: estimateNumberController,
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
                        for (int i = 0; i < controllers.value.length; i++)
                          TableRow(
                            children: [
                              TableTextFormField(
                                  controller: controllers.value[i][0]),
                              TableTextFormField(
                                controller: controllers.value[i][1],
                                onChanged: (_) => _calculateAmount(
                                    i, controllers, totalAmounts),
                              ),
                              TableTextFormField(
                                controller: controllers.value[i][2],
                              ),
                              TableTextFormField(
                                controller: controllers.value[i][3],
                                onChanged: (_) => _calculateAmount(
                                    i, controllers, totalAmounts),
                              ),
                              TableTextFormField(
                                totalAmount: totalAmounts.value[i],
                                controller: controllers.value[i][4],
                                isReadOnly: true, // 金額は読み取り専用
                              ),
                            ],
                          )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          _addNewRow(controllers, totalAmounts);
                        },
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
                            TotalMoneyTableRow(
                              label: '小計',
                              result: subtotal.value,
                            ).toTableRow(),
                            TotalMoneyTableRow(
                              label: '消費税(10％)',
                              result: tax.value,
                            ).toTableRow(),
                            TotalMoneyTableRow(
                              label: '合計',
                              result: total.value,
                            ).toTableRow(),
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
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '合計金額',
                            style: TextStyle(
                              color: ColorStyle.mainBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidthMargin.xLarge,
                          Text(
                            total.value.toString(),
                            style: const TextStyle(
                              color: ColorStyle.mainBlack,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidthMargin.mini,
                          const Text(
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
                  CustomPinkButton(
                    title: '保存',
                    titlePadding: 72.0,
                    onPressed: () async {
                      //PDF作成
                      final pdf = await PdfCreator.createPdf();
                      final pdfInBytes = await pdf.save();

                      //PDFをstorageにアップロードしてURLを取得
                      final downloadUrl = await ref
                          .read(storageControllerProvider.notifier)
                          .pdfUploadGetUrl(
                            pdfInBytes: pdfInBytes,
                          );

                      if (context.mounted) {
                        html.window.open(downloadUrl, '');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// 新しい行を追加するメソッド
  List<TextEditingController> _createNewRow() {
    return List.generate(5, (_) => TextEditingController());
  }

  void _addNewRow(ValueNotifier<List<List<TextEditingController>>> controllers,
      ValueNotifier<List<int>> totalAmounts) {
    controllers.value = [...controllers.value, _createNewRow()];
    totalAmounts.value = [...totalAmounts.value, 0];
  }

  //各行の金額を計算するメソッド
  void _calculateAmount(
      int index,
      ValueNotifier<List<List<TextEditingController>>> controllers,
      ValueNotifier<List<int>> totalAmounts) {
    final quantityController = controllers.value[index][1];
    final unitPriceController = controllers.value[index][3];
    final amountController = controllers.value[index][4];

    if (quantityController.text.isNotEmpty &&
        unitPriceController.text.isNotEmpty) {
      final quantity = int.tryParse(quantityController.text) ?? 0;
      final unitPrice = int.tryParse(unitPriceController.text) ?? 0;

      final amount = quantity * unitPrice;

      // 計算結果を金額フィールドにセット
      amountController.text = amount.toString();

      // totalAmountsを更新
      final newTotalAmounts = List<int>.from(totalAmounts.value);
      newTotalAmounts[index] = amount;
      totalAmounts.value = newTotalAmounts;
    } else {
      amountController.text = '';
      final newTotalAmounts = List<int>.from(totalAmounts.value);
      newTotalAmounts[index] = 0;
      totalAmounts.value = newTotalAmounts;
    }
  }

// 金額を計算するメソッド（小数点切り捨ての処理も含む）
  int _calculateTotalAmount(List<int> totalAmounts) {
    return totalAmounts.fold(
        0, (previousValue, element) => previousValue + element);
  }

// 消費税を計算するメソッド
  int _calculateTax(int totalAmount, double taxRate) {
    return (totalAmount * taxRate).floor(); // 小数点切り捨て
  }
}
