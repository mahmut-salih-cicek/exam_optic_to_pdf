import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

pdfOlustur(List veriler, String projeAdi, String serimNo) async {
  final Document pdf = Document();
  ByteData cursiveFont = await rootBundle
      .load('assets/fonts/OpenSans-Regular.ttf')
      .catchError((error) {
    print(error);
  });
  pdf.addPage(MultiPage(
      theme: Theme.withFont(
        base: Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
        bold: Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
        italic: Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
        boldItalic: Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
      ),
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: BoxDecoration(
                border:
                    BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('ProjeAdı sonucları',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        projeAdi.toUpperCase(),
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          font: Font.ttf(cursiveFont),
                        ),
                      ),
                      Text(
                        "Serim No: " + serimNo,
                        textScaleFactor: 1,
                        style: TextStyle(
                          font: Font.ttf(cursiveFont),
                        ),
                      ),
                    ])),
            Table.fromTextArray(
              context: context,
              data: <List<String>>[
                ...veriler.map((item) => item),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Paragraph(
              textAlign: TextAlign.center,
              text: ' SISAV Elastik Parametre Hesaplama Programı',
              style: TextStyle(
                font: Font.ttf(cursiveFont),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
          ]));

  final String dir =
      (await getApplicationDocumentsDirectory()).path; //getTemporaryDirectory
  //final String dir = (await getExternalStorageDirectory()).path;
  final String path = '$dir/SISAVParametreSonucu.pdf';
  final File file = File(path);

  await file.writeAsBytes(pdf.save());
  return path;
}
