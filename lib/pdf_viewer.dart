import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
class SonuclarPDFEkrani extends StatefulWidget {
 final String path,baslik;
  SonuclarPDFEkrani({this.path,this.baslik});

  @override
  _SonuclarPDFEkraniState createState() => _SonuclarPDFEkraniState();
}

class _SonuclarPDFEkraniState extends State<SonuclarPDFEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.baslik),),
      body: PdfViewer(
        filePath: widget.path,
      ),
    );
  }
}