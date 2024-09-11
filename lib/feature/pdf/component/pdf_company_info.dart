import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

class PdfCompanyInfo extends pw.StatelessWidget {
  PdfCompanyInfo({
    required this.logoImageData,
    required this.boldFontData,
  });

  final Uint8List logoImageData;
  final pw.Font boldFontData;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Stack(
        children: [
          //画像配置
          pw.Positioned(
            top: 0,
            right: 0,
            child: pw.Container(
              width: 80,
              height: 80,
              child: pw.Image(pw.MemoryImage(logoImageData)),
            ),
          ),
          pw.SizedBox(
            width: 200,
            height: 100,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '株式会社イーライフ\n',
                  style: pw.TextStyle(
                    fontSize: 18,
                    font: boldFontData,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  '東京本社：東京都渋谷区南平台町15-15\n電話番号：0120-620-999',
                  textAlign: pw.TextAlign.left,
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
                pw.SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
