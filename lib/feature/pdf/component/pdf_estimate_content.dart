import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:e_life_system/feature/pdf/component/form/item_tile.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfEstimateContent extends pw.StatelessWidget {
  PdfEstimateContent();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
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
            pw.Expanded(child: ItemTile(title: '水道工事')),
            ItemTile(title: '1'),
            ItemTile(title: '1'),
            ItemTile(title: '¥3,000', width: 80),
            ItemTile(title: '¥3,000', width: 80),
          ],
        ),
      ),
    );
  }
}
