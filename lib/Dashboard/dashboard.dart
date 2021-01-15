import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
//import 'package:qrcodescanner/Dashboard/documents.dart';
import 'package:qrcodescanner/Login/login.dart';
//import 'package:qrcodescanner/Login/login.dart';
import 'package:qrcodescanner/Signature/signdoc.dart';
import 'package:qrcodescanner/docinfo/docinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

//QR code
//import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrcodescanner/mydefined.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  List cards =[];
  SearchBar searchBar;

   AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title:  Text("ឯកសារ"),      
        actions: [searchBar.getSearchAction(context)]);
  }
  void onSubmitted(String value) {
    setState(() {
      print(value);
    });
    
  }

   _DashboardState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }
  
  refreshdata()
  {
    if (mounted) {
        if (doctype == "1")
        {
          setState(() {
              cards = [];
            });
          //getDocument('http://gs.obpathom.com/api/auth/comment');      
        }else if(doctype == "2")
        {
        getDocument('http://gs.obpathom.com/api/document-in');  
        }else if(doctype == '3')
        {
          getDocument('http://gs.obpathom.com/api/document-out');
        }else if(doctype == '4')
        {
          getDocument('http://gs.obpathom.com/api/document-internal');
        }
    }
   
  }
  
  getDocument(String url) async {
  final http.Response response = await http.get( url, // url to get login api
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': tokenkey,
    },
  );
  var item = json.decode(response.body)['data'];
  setState(() {
    cards = item;
  });
  
}

  String doctype = "";

@override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    doctype = "1";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.qr_code), onPressed: (){
        _scan();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,   
      appBar: searchBar.build(context),               
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text : "ឯកសារ"),
                      Tab(text : "ពត៌មានសង្ខេប"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                     Container(       
                      child: Column(   
                        crossAxisAlignment: CrossAxisAlignment.start,      
                        children: <Widget>[           
                            Container(
                              width: 200,
                              padding: EdgeInsets.fromLTRB(30,5,5,5),
                              child: DropdownButtonFormField(value: "1",
                                  items: [  
                                    DropdownMenuItem(child: Text("ឯកសារសុំចំណារ"),value: "1"),
                                    DropdownMenuItem(child: Text("ឯកសារចូល"),value: "2"),
                                    DropdownMenuItem(child: Text("ឯកសារចេញ"),value: "3"),
                                    DropdownMenuItem(child: Text("ឯកសារផ្ទៃក្នុង"),value: "4"),
                                    ],
                                    onChanged: (value){                                  
                                      setState(() {
                                        doctype = value;
                                        refreshdata();
                                      });
                                    },
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            //   child: Text("ឯកសារសុំចំណារ"),
                            // ),
                          Expanded(
                            child: getmycard()         
                          ),                         
                        ],
                      ),
                    ),
                     Expanded(
                        child: dashboardCard()
                    )
                  ]                
                )             
              ),          
          ],
        )
      ),
       drawer: Drawer(
         child: ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
         DrawerHeader(
            child: Center(
              child: Column(            
                children: <Widget>[                 
                  Container( 
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                    color: Color(0xff4f359b), 
                    borderRadius: BorderRadius.circular(80/2),
                    image: DecorationImage(                    
                        fit: BoxFit.cover,
                        image: new AssetImage("assets/images/myprofile.jpg"),
                        ),  
                      ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            child:  Text("Ven Seangmeng"),
                        ),
                       Container(                                                     
                           child:  Text("081 49 34 60",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,)),
                        ),                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
          ),
          ListTile(
            title: Text('អំពីកម្មវិធី ជំនាន់ទី​ ១.០'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('ចាកចេញ'),
            onTap: () async {
                    await http.post(
                          'http://gs.obpathom.com/api/logout', // url to get login api
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                       );
                      Navigator.pushReplacement( context,MaterialPageRoute(builder: (context) => new Loginpage()));
                          
              // Navigator.push( context,MaterialPageRoute(builder: (context) => new Loginpage()));     
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),),
    );
  }
  Widget getmycard(){  
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder:  (context,index){
        return mydoccard(cards[index]);
    });
  }

  Widget mydoccard(card){
    return   Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //       width: 2,
                //       color: Colors.black,
                //   ),
                // ),
               
                child: Card(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                          child: Text("លេខចូលឬចេញ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ថ្ងៃខែ ឯកសារ​ចូលឬ​ ចេញ"),
                      ),
                       Container(
                          padding: EdgeInsets.all(5),
                          child: Text("កម្មវត្ថុឯកសារ"),
                      ),                                                                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [                           
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 100, 5),
                            child : RaisedButton(
                                          textColor: Colors.white,
                                          color: Colors.blue,                                  
                                          child: Text("ផ្តល់ចំណារ"),
                                          onPressed: (){                                  
                                            Navigator.push( context,MaterialPageRoute(builder: (context) => Signdoc()));
                                          }),                                                                                   
                                ),                                   
                            Container(                             
                              padding: EdgeInsets.all(5),
                              child :  FlatButton(
                              textColor: Colors.blue,                       
                              child: Text(
                                'ពត៌មាន',
                                style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                              ),
                              onPressed: () { 
                                setState(() {
                                  String ind = card['id'].toString();        
                                  Navigator.push( context,MaterialPageRoute(builder: (context) =>new Docinfo(docid:ind,doctype: doctype)));                        
                                });                                                            
                              // Navigator.push( context,MaterialPageRoute(builder: (context) => Docinfo()));
                              },
                            ),
                          )
                        ],                        
                      ),                                                    
                    ],
                  )
                ),
              ),
            );           
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();  
    if (barcode == null) {
      print('nothing return.');
    } else {
      print(barcode);
     // this._outputController.text = barcode;
    }
  }

  Widget dashboardCard(){
    return ListView(
      children: [
          Padding(
          padding: EdgeInsets.all(10),
            child: Container(
              child: Card(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                          child: Text("ឯកសារសុំចំណារ ថ្ងៃនេះមានចំនួន 100",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារសុំចំណារ ខែនេះមានចំនួន 200"),
                      ),
                       Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារសុំចំណារ ឆ្នាំនេះមានចំនួន 500"),
                      ),                                                                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                                                                             
                            Container(                             
                              padding: EdgeInsets.all(5),
                              child :  FlatButton(
                              textColor: Colors.blue,                       
                              child: Text(
                                'ពត៌មាន',
                                style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                              ),
                              onPressed: () {
                              //  Navigator.push( context,MaterialPageRoute(builder: (context) => Docinfo()));
                              },
                            ),
                          )
                        ],                        
                      ),                                                    
                    ],
                  )
                ),
            ),
          ),
          Padding(
          padding: EdgeInsets.all(10),
            child: Container(
              child: Card(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចូល ថ្ងៃនេះមានចំនួន 100",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចូល ខែនេះមានចំនួន 200"),
                      ),
                       Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចូល ឆ្នាំនេះមានចំនួន 500"),
                      ),                                                                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                                                                             
                            Container(                             
                              padding: EdgeInsets.all(5),
                              child :  FlatButton(
                              textColor: Colors.blue,                       
                              child: Text(
                                'ពត៌មាន',
                                style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                              ),
                              onPressed: () {
                                //Navigator.push( context,MaterialPageRoute(builder: (context) => Docinfo()));
                              },
                            ),
                          )
                        ],                        
                      ),                                                    
                    ],
                  )
                ),
            ),
          ),
          Padding(
          padding: EdgeInsets.all(10),
            child: Container(
              child: Card(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចេញ ថ្ងៃនេះមានចំនួន 100",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចេញ ខែនេះមានចំនួន 200"),
                      ),
                       Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារចេញ ឆ្នាំនេះមានចំនួន 500"),
                      ),                                                                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                                                                             
                            Container(                             
                              padding: EdgeInsets.all(5),
                              child :  FlatButton(
                              textColor: Colors.blue,                       
                              child: Text(
                                'ពត៌មាន',
                                style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                              ),
                              onPressed: () {
                               // Navigator.push( context,MaterialPageRoute(builder: (context) => Docinfo()));
                              },
                            ),
                          )
                        ],                        
                      ),                                                    
                    ],
                  )
                ),
            ),
          ),
          Padding(
          padding: EdgeInsets.all(10),
            child: Container(
              child: Card(                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                          child: Text("ឯកសារផ្ទៃក្នុង ថ្ងៃនេះមានចំនួន 100",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារផ្ទៃក្នុង ខែនេះមានចំនួន 200"),
                      ),
                       Container(
                          padding: EdgeInsets.all(5),
                          child: Text("ឯកសារផ្ទៃក្នុង ឆ្នាំនេះមានចំនួន 500"),
                      ),                                                                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                                                                             
                            Container(                             
                              padding: EdgeInsets.all(5),
                              child :  FlatButton(
                              textColor: Colors.blue,                       
                              child: Text(
                                'ពត៌មាន',
                                style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                              ),
                              onPressed: () {
                               // Navigator.push( context,MaterialPageRoute(builder: (context) => Docinfo()));
                              },
                            ),
                          )
                        ],                        
                      ),                                                    
                    ],
                  )
                ),
            ),
          )
      ],
    );
  }
}