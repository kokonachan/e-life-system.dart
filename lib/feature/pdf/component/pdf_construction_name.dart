import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfConstructionName extends pw.StatelessWidget {
  PdfConstructionName();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      height: 30,
      width: 300,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          color: PdfColor.fromInt(ColorStyle.mainBlack.value),
        ),
      ),
      child: pw.Padding(
        padding: const pw.EdgeInsets.all(2.0),
        child: pw.Container(
          height: 30,
          width: 300,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColor.fromInt(ColorStyle.mainBlack.value),
            ),
          ),
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(2.0),
              child: pw.Text(
                '<工事名> 水道工事の名称',
                style: const pw.TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
