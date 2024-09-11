import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/feature/pdf/component/form/item_tile.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfConstructionItemName extends pw.StatelessWidget {
  PdfConstructionItemName();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(top: 10.0),
      child: pw.Container(
        color: PdfColor.fromInt(ColorStyle.backGroundGrey.value),
        child: pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 2.0),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(child: ItemTile(title: '名称')),
              ItemTile(title: '数量'),
              ItemTile(title: '単位'),
              ItemTile(title: '単価', width: 80),
              ItemTile(title: '金額', width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
