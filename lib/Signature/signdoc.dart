import 'package:qrcodescanner/Viewdoc/viewdoc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';


class Signdoc extends StatefulWidget {
  @override
  _SigndocState createState() => _SigndocState();
}

class _SigndocState extends State<Signdoc> {
   SearchBar searchBar;
   String myoptionval;

   AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title:  Text("ផ្តល់ចំណារ"),         
        // actions: [
        //   searchBar.getSearchAction(context),
        //   PopupMenuButton<String>(
        //     onSelected: (val){
        //       setState(() {
        //         myoptionval = val;
        //       });
        //     },
        //     itemBuilder: (BuildContext context) => [
        //       PopupMenuItem(
        //         value: "1",
        //         child: Text("First Item"),
        //       ),
        //       PopupMenuItem(
        //         value: "2",
        //         child: Text("Second Item"),
        //       ),
        //     ],
        //     )
        //   ]
          );
    }
    void onSubmitted(String value) {
      setState(() {
        print(value);
      });
    }
   _SigndocState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),                    
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 220,
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
                      padding: EdgeInsets.all(10),
                        child: Text("លេខចូលឬចេញ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text("ថ្ងៃខែ ឯកសារ​ចូលឬ​ ចេញ"),
                    ),
                     Container(
                        padding: EdgeInsets.all(10),
                        child: Text("កម្មវត្ថុឯកសារ"),
                    ),                                                                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [                           
                        Container(
                          padding: EdgeInsets.all(10),
                          child : RaisedButton(
                                        textColor: Colors.white,
                                        color: Colors.blue,                                  
                                        child: Text("ផ្តល់ចំណារ"),
                                        onPressed: (){                                  
                                          Navigator.push( context,MaterialPageRoute(builder: (context) => Viewdoc()));
                                        }),                                                                                   
                              ),                                   
                      ],                        
                    ),                                                    
                  ],
                )
              ),
            ),
        ),
      )
    );
  }
}