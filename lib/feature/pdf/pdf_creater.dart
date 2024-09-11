import 'package:e_life_system/config/utils/color/color_style.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

//PDF作成クラス
class PdfCreator {
  static pw.Font? font;

  // Googleフォントを取得して埋め込むことも可能
  static Future<void> loadCustomFont() async {
    final fontData = await rootBundle
        .load('assets/fonts/Noto_Sans_JP/NotoSansJP-Regular.ttf');
    font = pw.Font.ttf(fontData);
  }

  static Future<pw.Document> createPdf() async {
    final pdf = pw.Document();
    await loadCustomFont(); // フォントの読み込みを待機

    // PDFに描画する内容を構築
    final title = pw.Column(
      children: [
        pw.Text(
          '株式会社イーライフ',
          style: pw.TextStyle(
            font: font,
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          '東京本社：東京都渋谷区南平台町15-15',
          style: pw.TextStyle(
            font: font,
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          '電話番号：0120-620-999',
          style: pw.TextStyle(
            font: font,
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 10),
      ],
    );

    final basicInfo = pw.Container(
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor.fromInt(ColorStyle.mainBlue.value),
          ),
          top: pw.BorderSide(
            color: PdfColor.fromInt(ColorStyle.mainBlue.value),
          ),
        ),
      ),
      child: pw.Padding(
        padding: const pw.EdgeInsets.all(10),
        child: pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(
                color: PdfColor.fromInt(ColorStyle.mainBlue.value),
              ),
              top: pw.BorderSide(
                color: PdfColor.fromInt(ColorStyle.mainBlue.value),
              ),
            ),
          ),
          child: pw.Column(
            children: [
              pw.Text(
                '御見積書',
                style: pw.TextStyle(
                  font: font,
                  fontSize: 30,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                '御見積書',
                textAlign: pw.TextAlign.right,
                style: pw.TextStyle(
                  font: font,
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final trialPeriodInfo = pw.Column(
      children: [
        pw.SizedBox(height: 10),
        pw.Text(
          '平素は格別のご高配を賜り厚く御礼申し上げます。下記のとおり御見積致します。',
          style: pw.TextStyle(
            font: font,
            fontSize: 16,
          ),
        ),
      ],
    );

    final workPlaceInfo = pw.Row(
      children: [
        pw.Column(
          children: [
            pw.Container(
              width: 400,
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(
                    color: PdfColor.fromInt(ColorStyle.mainBlue.value),
                  ),
                ),
              ),
              child: pw.Text(
                '<施行期日>',
                style: pw.TextStyle(
                  font: font,
                  fontSize: 16,
                ),
              ),
            ),
            pw.Column(
              children: [
                pw.Container(
                  width: 400,
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(
                        color: PdfColor.fromInt(ColorStyle.mainBlue.value),
                      ),
                    ),
                  ),
                  child: pw.Text(
                    '<見積有効期間>',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    // `MultiPage`を使用してPDFに内容を追加
    pdf.addPage(
      pw.MultiPage(
        //フォントサイズを指定
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
            font: font,
            fontSize: 8,
          ),
        ),
        build: (pw.Context context) {
          return [
            title,
            basicInfo,
            trialPeriodInfo,
            workPlaceInfo,
          ];
        },
        // 必要に応じて他の`MultiPage`の設定をここに追加
        footer: (context) {
          return pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Column(
              children: [
                pw.Text('${context.pageNumber}'),
              ],
            ),
          );
        },
      ),
    );

    // PDFに内容を追加

    return pdf;
  }
}
