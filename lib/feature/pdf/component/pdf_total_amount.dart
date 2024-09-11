import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfTotalAmount extends pw.StatelessWidget {
  PdfTotalAmount();

  @override
  pw.Widget build(pw.Context context) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10.0),
        child: pw.Column(
          children: [
            for (int i = 0; i < 3; i++)
              pw.Container(
                width: 300,
                height: 20,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                    color: PdfColor.fromInt(ColorStyle.mainBlack.value),
                  ),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Container(
                      height: 20,
                      width: 150,
                      decoration: pw.BoxDecoration(
                        color:
                            PdfColor.fromInt(ColorStyle.backGroundGrey.value),
                        border: pw.Border.all(
                          color: PdfColor.fromInt(ColorStyle.mainBlack.value),
                        ),
                      ),
                      child: pw.Center(
                        child: pw.Text(
                          switchText(i),
                          style: const pw.TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Center(
                        child: pw.Text(
                          '¥300,000',
                          style: const pw.TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

String switchText(int i) {
  switch (i) {
    case 0:
      return '小計';
    case 1:
      return '消費税(10％)';
    case 2:
      return '合計';
    default:
      return '';
  }
}
