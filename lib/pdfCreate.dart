import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:ext_storage/ext_storage.dart';

pdfOlustur(List tablo, List maddeler, String paragraf, String baslik) async {
  //pdf dosyası oluşturuyoruz.
  final Document pdf = Document();
  //pdf dosyamızı biçimlendiriyoruz ve genelinde hangi font kullanılacak onu ayarluyoruz.
  ByteData cursiveFont = await rootBundle
      .load('assets/fonts/OpenSans-Regular.ttf')
      .catchError((error) {
    print(error);
  });
  //pdf sayfamızı ekliyoruz
  pdf.addPage(MultiPage(
      //sayfa için font ayarları
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
          child: Text(
            'avseng',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      build: (Context context) => <Widget>[
            //başlık kısmını düzenliyoruz.
            Header(
                level: 0,
                child: Text("$baslik"),
                textStyle: TextStyle(fontSize: 18)),
            Table.fromTextArray(
              context: context,
              data: <List<String>>[
                ...tablo.map((item) => item),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Paragraph(
              textAlign: TextAlign.center,
              text: paragraf,
              style: TextStyle(
                font: Font.ttf(cursiveFont),
              ),
            ),

//maddeleri buraya koyacağız.
            Bullet(
              text: maddeler[0],
            ),
            Bullet(
              text: maddeler[1],
            ),
            Bullet(
              text: maddeler[2],
            ),
            Bullet(
              text: maddeler[3],
            ),
            Bullet(
              text: maddeler[4],
            ),
            Bullet(
              text: maddeler[5],
            ),

            Padding(padding: EdgeInsets.all(10)),
          ]));

  //final String dir =
  //    (await getApplicationDocumentsDirectory()).path; //getTemporaryDirectory
  final String dir = await ExtStorage.getExternalStoragePublicDirectory(
  ExtStorage.DIRECTORY_DOWNLOADS);
  final String path = '$dir/xmoddddddddddd.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  return path;
}
