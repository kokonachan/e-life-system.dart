import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfEstimateBasicInfo extends pw.StatelessWidget {
  PdfEstimateBasicInfo({required this.boldFontData});

  final pw.Font boldFontData;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            DateContainer(title: '<施行期日>'),
            DateContainer(title: '<見積有効期間>'),
          ],
        ),
        pw.Expanded(
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(10),
            child: pw.Container(
              height: 40,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColor.fromInt(ColorStyle.estimateColor.value),
                  width: 3,
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Container(
                    height: 40,
                    width: 120,
                    decoration: pw.BoxDecoration(
                      color:
                          PdfColor.fromInt(ColorStyle.estimateBackColor.value),
                      border: pw.Border.all(
                        color: PdfColor.fromInt(ColorStyle.estimateColor.value),
                        width: 3,
                      ),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        '御見積金額',
                        style: pw.TextStyle(
                          fontSize: 18,
                          font: boldFontData,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Center(
                      child: pw.Text(
                        '¥300,000',
                        style: pw.TextStyle(
                          fontSize: 18,
                          font: boldFontData,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DateContainer extends pw.StatelessWidget {
  DateContainer({
    required this.title,
  });

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      width: 200,
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor.fromInt(ColorStyle.estimateColor.value),
          ),
        ),
      ),
      child: pw.Text(
        title,
        style: const pw.TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }
}
