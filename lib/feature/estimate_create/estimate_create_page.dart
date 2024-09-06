import 'package:e_life_system/common/color/color_style.dart';
import 'package:e_life_system/common/margin/height_margin.dart';
import 'package:e_life_system/feature/estimate_create/component/label_and_text_form_field.dart';
import 'package:e_life_system/feature/estimate_create/component/page_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EstimateCreatePage extends HookConsumerWidget {
  const EstimateCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      ),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
