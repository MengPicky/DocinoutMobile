import 'package:flutter/material.dart';

class Imageviewer extends StatefulWidget {
  @override
  _ImageviewerState createState() => _ImageviewerState();  
}

class _ImageviewerState extends State<Imageviewer> {
   bool _isLoading = true;
   Image img ;

  loadingImage() async {
    img = Image.network('https://p.calameoassets.com/180515111509-087734d3ab9181b3dbabd2c3eab490b6/p1.jpg');
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    loadingImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _isLoading ?
       Center(child: CircularProgressIndicator(),)
       :Padding(
       padding: const EdgeInsets.fromLTRB(0,20,0,0),
       child: SizedBox(
         width: double.infinity,
         height: double.infinity,
         child:  img,
       ),
     )
    );
  }
}