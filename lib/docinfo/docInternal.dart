import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrcodescanner/imageview/viewimage.dart';
import 'package:http/http.dart' as http;
import 'package:qrcodescanner/mydefined.dart';

// ignore: must_be_immutable
class DocInternal extends StatefulWidget {
  var docinternaldata;
  var docid;
  @override
  _DocInternalState createState() => _DocInternalState();
  DocInternal(this.docid);
}
 TextStyle mystyle = TextStyle(
     fontSize: 18,
     color: Colors.grey,
     fontFamily: "Khmer OS",
   );
class _DocInternalState extends State<DocInternal> {
   getDocumentdetail() async {    
    String   url = "http://gs.obpathom.com/api/document-internal/" + widget.docid;
    final http.Response response = await http.get( url, // url to get login api
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': tokenkey,
      },
    );
    var item = json.decode(response.body)['data'][0];
      setState(() {
         widget.docinternaldata =  item;       
        });        
}
@override
  void initState() {
    getDocumentdetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.docinternaldata !=null ?  DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text : "ឯកសារ"),
                      Tab(text : "កំណត់ត្រា"),
                      Tab(text : "រូបភាព"),
                    ],
                  ),
                ),
              ),           
              Expanded(
                child: TabBarView(
                  children: [
                  Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: ListView(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(10),
                           child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("លេខឯកសារ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text(widget.docinternaldata['document_code'],style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                           ),
                         ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("ថ្ងៃខែឆ្នាំ\nឯកសារ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text(widget.docinternaldata['arrival_date'],style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("មកពីអង្គភាព",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("អ្នកដាក់ឯកសារ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text('.............',style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("អ្នកទទួលឯកសារ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text(widget.docinternaldata['receiver']['name'],style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("ជាដីការអម",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("ប្រភេទឯកសារ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text(widget.docinternaldata['document_type']['title'],style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("កម្មវត្ថុ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text(widget.docinternaldata['objective'],style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                       ],
                     ),
                   ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("ប្រភេទលំហូរ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("កន្លែងមុខការបន្ត",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("អ្នកមុខការ",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("អ្នកប្រគល់/\nអ្នកទទួល",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(                                 
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,                     
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Container(     
                                    child: Text("ថ្ងៃខែឆ្នាំប្រគល់/\nទទួល",style: mystyle,),                        
                                 ) 
                               ),
                                Expanded(
                                  flex: 2,
                                  child: Container(                                 
                                    child: Text("..........",style: mystyle,),                         
                                 )                          
                               ),                                          
                             ],
                         ),
                        ),
                      ],
                    ),  
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start, 
                      children: [
                        Expanded(
                          child:   Container(   
                            height: 220,                                                                     
                            child: Card(
                              child: Container(   
                                //  decoration: BoxDecoration(
                                //  borderRadius: BorderRadius.circular(10),
                                //  border: Border.all(
                                //       width: 2,
                                //       color: Colors.black,
                                //   ),
                                // ),                             
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                    child: Text("លេខឯកសារ : " + widget.docinternaldata['document_code'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text("កាលបរិច្ឆេទឯកសារ : " + widget.docinternaldata['arrival_date']),
                                ),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text("កម្មវត្ថុឯកសារ : " + widget.docinternaldata['objective']),
                                ),                                                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [                           
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child : RaisedButton(
                                                    textColor: Colors.white,
                                                    color: Colors.blue,                                  
                                                    child: Text("មើលរូបភាព"),
                                                    onPressed: (){                                  
                                                      Navigator.push( context,MaterialPageRoute(builder: (context) => Imageviewer()));
                                                    }),                                                                                   
                                          ),                                   
                                      ],                        
                                    ),                                                    
                                  ],
                                ),
                              ), 
                            ),
                          ),                      
                        )                          
                        ],
                      ),  
                    ),
                 ],
                ),
              ),
            ],
          ),
        ):Container(

        );
  }
}