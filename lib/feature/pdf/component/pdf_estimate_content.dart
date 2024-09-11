import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/feature/pdf/component/form/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfEstimateContent extends pw.StatelessWidget {
  PdfEstimateContent({
    required this.controllers,
  });

  final List<List<TextEditingController>> controllers;

  @override
  pw.Widget build(pw.Context context) {
    final formatter = NumberFormat('#,###');
    // for文を使って、pw.Containerのリストを生成
    List<pw.Widget> contentWidgets = [];
    for (int i = 0; i < controllers.length; i++) {
      contentWidgets.add(
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(
                color: PdfColor.fromInt(ColorStyle.mainBlack.value),
              ),
            ),
          ),
          child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(child: ItemTile(title: controllers[i][0].text)),
                ItemTile(title: controllers[i][1].text),
                ItemTile(title: controllers[i][2].text),
                ItemTile(
                  width: 80,
                  title: controllers[i][3].text.isEmpty
                      ? '¥0'
                      : '¥${formatter.format(int.parse(controllers[i][3].text))}',
                ),
                ItemTile(
                  width: 80,
                  title: controllers[i][4].text.isEmpty
                      ? '¥0'
                      : '¥${formatter.format(int.parse(controllers[i][4].text))}',
                ),
              ],
            ),
          ),
        ),
      );
    }

    // リストをpw.Columnに包んで返す
    return pw.Column(children: contentWidgets);
  }
}
