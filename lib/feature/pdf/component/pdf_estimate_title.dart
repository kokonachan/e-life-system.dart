import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfEstimateTitle extends pw.StatelessWidget {
  PdfEstimateTitle({
    required this.boldFontData,
    required this.estimateNumber,
  });

  final pw.Font boldFontData;
  final String estimateNumber;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      width: double.infinity,
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor.fromInt(ColorStyle.estimateColor.value),
            width: 7,
          ),
          top: pw.BorderSide(
            color: PdfColor.fromInt(ColorStyle.estimateColor.value),
            width: 7,
          ),
        ),
      ),
      child: pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10.0),
        child: pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(
                color: PdfColor.fromInt(ColorStyle.estimateColor.value),
                width: 3,
              ),
              top: pw.BorderSide(
                color: PdfColor.fromInt(ColorStyle.estimateColor.value),
                width: 3,
              ),
            ),
          ),
          child: pw.Column(
            children: [
              pw.Text(
                '御見積書',
                style: pw.TextStyle(
                  fontSize: 30,
                  font: boldFontData,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  '見積書番号：$estimateNumber',
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColor.fromInt(ColorStyle.estimateColor.value),
                  ),
                ),
              ),
              pw.SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
