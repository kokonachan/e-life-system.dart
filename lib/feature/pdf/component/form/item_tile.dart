import 'package:pdf/widgets.dart' as pw;

class ItemTile extends pw.StatelessWidget {
  ItemTile({
    required this.title,
    this.width = 60,
  });

  final String title;
  final double width;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      width: width,
      child: pw.Text(
        title,
        style: const pw.TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }
}
