import 'package:e_life_system/feature/pdf/component/pdf_company_info.dart';
import 'package:e_life_system/feature/pdf/component/pdf_construction_item_name.dart';
import 'package:e_life_system/feature/pdf/component/pdf_construction_name.dart';
import 'package:e_life_system/feature/pdf/component/pdf_estimate_basic_info.dart';
import 'package:e_life_system/feature/pdf/component/pdf_estimate_content.dart';
import 'package:e_life_system/feature/pdf/component/pdf_estimate_title.dart';
import 'package:e_life_system/feature/pdf/component/pdf_total_amount.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

//PDF作成クラス
class PdfCreator {
  static pw.Font? regularFont;
  static pw.Font? boldFont;

  // Googleフォントを取得して埋め込むことも可能
  static Future<void> loadCustomFont() async {
    // レギュラーフォントの読み込み
    final regularFontData = await rootBundle
        .load('assets/fonts/Noto_Sans_JP/NotoSansJP-Regular.ttf');
    regularFont = pw.Font.ttf(regularFontData);

    // ボールドフォントの読み込み
    final boldFontData =
        await rootBundle.load('assets/fonts/Noto_Sans_JP/NotoSansJP-Bold.ttf');
    boldFont = pw.Font.ttf(boldFontData);
  }

  static Future<pw.Document> createPdf() async {
    final pdf = pw.Document();
    await loadCustomFont(); // フォントの読み込みを待機

    // 認証スタンプの読み込み
    final logoImageData =
        (await rootBundle.load('assets/images/confirm_stamp.png'))
            .buffer
            .asUint8List();

    // PDFに描画する内容を構築

    //会社情報
    final companyInfo = PdfCompanyInfo(
      logoImageData: logoImageData,
      boldFontData: boldFont!,
    );

    //見積タイトル
    final estimateTitle = PdfEstimateTitle(
      boldFontData: boldFont!,
    );

    //導入文
    final introduction = pw.Column(
      children: [
        pw.SizedBox(height: 10),
        pw.Text(
          '平素は格別のご高配を賜り厚く御礼申し上げます。下記のとおり御見積致します。',
          style: const pw.TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );

    //見積基本情報
    final estimateBasicInfo = PdfEstimateBasicInfo(
      boldFontData: boldFont!,
    );

    //工事名
    final constructionName = PdfConstructionName();

    //項目名
    final constructionItemName = PdfConstructionItemName();

    //見積内容
    final estimateContent = PdfEstimateContent();

    final totalAmount = PdfTotalAmount();

    // `MultiPage`を使用してPDFに内容を追加
    pdf.addPage(
      pw.MultiPage(
        //フォントサイズを指定
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
            font: regularFont,
          ),
        ),
        build: (pw.Context context) {
          return [
            companyInfo,
            estimateTitle,
            introduction,
            estimateBasicInfo,
            constructionName,
            constructionItemName,
            for (int i = 0; i < 4; i++) estimateContent,
            totalAmount,
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
