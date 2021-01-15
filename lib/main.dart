// import 'dart:async';
// import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login/login.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.green[800],
        ),
        home: Loginpage(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Uint8List bytes = Uint8List(0);
//  // TextEditingController _inputController;
//   TextEditingController _outputController;

//   @override
//   initState() {
//     super.initState();
//     //this._inputController = new TextEditingController();
//     this._outputController = new TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//    return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: Builder(
//           builder: (BuildContext context) {
//             return ListView(
//               children: <Widget>[
//                 Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       TextField(
//                         controller: this._outputController,
//                         maxLines: 2,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.wrap_text),
//                           helperText:
//                               'The barcode or qrcode you scan will be displayed in this area.',
//                           hintText:
//                               'The barcode or qrcode you scan will be displayed in this area.',
//                           hintStyle: TextStyle(fontSize: 15),
//                           contentPadding:
//                               EdgeInsets.symmetric(horizontal: 7, vertical: 15),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       this._buttonGroup(),
//                       SizedBox(height: 70),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//    Widget _buttonGroup() {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             height: 120,
//             child: InkWell(
//               onTap: _scan,
//               child: Card(
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       flex: 2,
//                       child: Image.asset('assets/images/scanner.png'),
//                     ),
//                     Divider(height: 20),
//                     Expanded(flex: 1, child: Text("Scan")),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//    Future _scan() async {
//     await Permission.camera.request();
//     String barcode = await scanner.scan();
    
//     if (barcode == null) {
//       print('nothing return.');
//     } else {
//       this._outputController.text = barcode;
//     }
//   }

//   // Future _scanPhoto() async {
//   //   await Permission.storage.request();
//   //   String barcode = await scanner.scanPhoto();
//   //   this._outputController.text = barcode;
//   // }

//   // Future _scanPath(String path) async {
//   //   await Permission.storage.request();
//   //   String barcode = await scanner.scanPath(path);
//   //   this._outputController.text = barcode;
//   // }

//   // Future _scanBytes() async {
//   //   // ignore: deprecated_member_use
//   //   File file = await ImagePicker.pickImage(source: ImageSource.camera);
//   //   if (file == null) return;
//   //   Uint8List bytes = file.readAsBytesSync();
//   //   String barcode = await scanner.scanBytes(bytes);
//   //   this._outputController.text = barcode;
//   // }

// }