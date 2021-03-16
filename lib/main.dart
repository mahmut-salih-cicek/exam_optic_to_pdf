import 'package:flutter/material.dart';
import 'package:pdf_create/pdfCreate.dart';
import 'package:pdf_create/pdf_viewer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


@override
void initState() {
// TODO: implement initState
super.initState();
getPermission();
}

   //get storage permission
  void getPermission() async {
    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }
 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Anasayfa(), );
  }
}

class Anasayfa extends StatefulWidget {

 

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  String string1a = "";
  String stringB = "";
  String stringC = "";
  String stringD = "";
  String stringE = "";




    bool rememberMe1a = false;
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe1a = newValue;

    if (rememberMe1a) {
     string1a = "A";
    } else {
     string1a = "";
    }
  });


    bool rememberMe1b = false;
  void _onRememberMeChanged2(bool newValue) => setState(() {
    rememberMe1b = newValue;

    if (rememberMe1b) {
     string1a = "A";
    } else {
     string1a = "";
    }
  });

    bool rememberMe1c = false;
  void _onRememberMeChanged3(bool newValue) => setState(() {
    rememberMe1c = newValue;

    if (rememberMe1c) {
     string1a = "A";
    } else {
     string1a = "";
    }
  });

    bool rememberMe1d = false;
  void _onRememberMeChanged4(bool newValue) => setState(() {
    rememberMe1d = newValue;

    if (rememberMe1d) {
     string1a = "A";
    } else {
     string1a = "";
    }
  });

    bool rememberMe1e = false;
  void _onRememberMeChanged5(bool newValue) => setState(() {
    rememberMe1e = newValue;

    if (rememberMe1e) {
     string1a = "A";
    } else {
     string1a = "";
    }
  });



   List<List<String>> tabloElemanlari = new List();
List<String> basliklar = [
    "Turkce",
    "Matematik",
    "Sosyal",
    "Fen"
  ];
  List<String> tabloSatir1 = [
    "1 A",
    "1 B",
    "1 D",
    "1 B"
  ];

  List<String> tabloSatir2 = [
    "2-) A",
    "2-) b",
    "2-) C",
    "2-) E"
  ];

  List<String> tabloSatir3 = [
    "3-) A",
    "3-) C",
    "3-) E",
    "3-) A"
  ];

  List<String> tabloSatir4 = [
    "4-) B",
    "4-) A",
    "4-) C",
    "4-) E"
  ];

  List<String> tabloSatir5 = [
    "",
    "",
    "",
    ""
  ];

  List<String> tabloSatir6 = [
    "",
    "",
    "",
    ""
  ];

  List<String> listeElemanlari = [
    "liste madde1",
    "liste madde2",
    "liste madde3",
    "liste madde4",
    "liste madde5",
    "liste madde6",
  ];

  String paragraf =
      "DÜZ METİN BURDA";

@override
  void initState() {
    super.initState();
    tabloElemanlari.add(basliklar);
    tabloElemanlari.add(tabloSatir1);
    tabloElemanlari.add(tabloSatir2);
    tabloElemanlari.add(tabloSatir3);
    tabloElemanlari.add(tabloSatir4);
    tabloElemanlari.add(tabloSatir5);
    tabloElemanlari.add(tabloSatir6);
  }


  @override
  Widget build(BuildContext context) {
    bool check = true;
    String TextA = "";
    return Scaffold(
        appBar: AppBar(
          title: Text("pdf"),
        ),
        body:  new Column(
        children: <Widget>[
          
          new Expanded(
            child: ListView(
              children: [







                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 6,
                    child: Stack(
                      children: [
                        SizedBox(height: 110,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(height: 50, width:20,
                                ),
                                Text("1",style: TextStyle(fontSize: 25),
                                ),
                                  ],
                                ),
                                Column(
                                 
                                  children: [
                                   
                                   Row(
                                      
                                     children: [
                                      
                                       SizedBox(width: 20,),
                                        Text("A",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1a,
                                  onChanged: _onRememberMeChanged
                                   ),

                                     SizedBox(width: 15,),
                                        Text("B",style: TextStyle(fontSize: 25),
                                        ),
                                
                                 Checkbox(
                                 value: rememberMe1b,
                                  onChanged: _onRememberMeChanged2
                                   ),
                                     SizedBox(width: 15,),
                                        Text("C",style: TextStyle(fontSize: 25),
                                        ),
                                  
                                 Checkbox(
                                 value: rememberMe1c,
                                  onChanged: _onRememberMeChanged3
                                   ),


                                     SizedBox(width: 15,),
                                        Text("D",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1d,
                                  onChanged: _onRememberMeChanged4
                                   ),
                                        


                                          SizedBox(width: 15,),
                                        Text("E",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1e,
                                  onChanged: _onRememberMeChanged5
                                   ),






                                     ],
                                   ),
                                  ],

                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                        
                      ],
                    ),
                  ),

               ////////////////////
               
               Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 6,
                    child: Stack(
                      children: [
                        SizedBox(height: 110,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(height: 50, width:20,
                                ),
                                Text("2",style: TextStyle(fontSize: 25),
                                ),
                                  ],
                                ),
                                Column(
                                 
                                  children: [
                                   
                                   Row(
                                      
                                     children: [
                                      
                                       SizedBox(width: 20,),
                                        Text("A",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1a,
                                  onChanged: _onRememberMeChanged
                                   ),

                                     SizedBox(width: 15,),
                                        Text("B",style: TextStyle(fontSize: 25),
                                        ),
                                
                                 Checkbox(
                                 value: rememberMe1b,
                                  onChanged: _onRememberMeChanged2
                                   ),
                                     SizedBox(width: 15,),
                                        Text("C",style: TextStyle(fontSize: 25),
                                        ),
                                  
                                 Checkbox(
                                 value: rememberMe1c,
                                  onChanged: _onRememberMeChanged3
                                   ),


                                     SizedBox(width: 15,),
                                        Text("D",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1d,
                                  onChanged: _onRememberMeChanged4
                                   ),
                                        


                                          SizedBox(width: 15,),
                                        Text("E",style: TextStyle(fontSize: 25),
                                        ),
                                   
                                 Checkbox(
                                 value: rememberMe1e,
                                  onChanged: _onRememberMeChanged5
                                   ),






                                     ],
                                   ),
                                  ],

                                ),
                              ],
                            ),
                          ],
                        ),
                        ),
                        
                      ],
                    ),
                  ),













              ],
            ),
                   
             
            ),
        

          RaisedButton(
            child: Text("Pdf Oluştur./PDF Create"),
            onPressed: () async {
                            // pdf gönderme bölümü
                            
                             
                            //bekleme ekranına yönlendir.
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Scaffold(
                                body: Container(
                                  //color: Color.fromRGBO(0, 179, 134, 1.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "PDF oluşturuluyor...",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        CircularProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));

                            List veriler = List();
                            
                            print(veriler.length.toString() +
                                " veri listesi sayısı");
                            String pth = await pdfOlustur(tabloElemanlari,
                                listeElemanlari, paragraf,"Liste");
                            /* Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PdfViewerPage(pth), */
                            Navigator.pop(context);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SonuclarPDFEkrani(
                                  path: pth,
                                  baslik: "Liste",
                                ),
                              ),
                            );
                          },
          ),
          
        ],
      )
    );
  }

}
 








  