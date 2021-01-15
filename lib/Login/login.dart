//import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
//import 'package:qrcodescanner/Login/loginclass.dart';
import 'package:qrcodescanner/Dashboard/dashboard.dart';
import 'package:qrcodescanner/Login/loginclass.dart';
import 'package:qrcodescanner/mydefined.dart';



class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

// Future<int> getuser(String uname,String upassword) async {
//   final http.Response response = await http.post(
//     'http://gs.obpathom.com/api/auth/login', // url to get login api
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'email': uname,
//       'password' : upassword,
//     }),
//   );

//   if (response.statusCode == 201) {
//     return 1;
//   } else {
//     return 0;
//   }
// }

class _LoginpageState extends State<Loginpage> {
  bool _isvalidate =false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(       
        body: Padding(
            padding: EdgeInsets.fromLTRB(10,20,10,10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/images/MEF_(Cambodia).png",width: 100,height: 100,),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                
                Container(
                  padding: EdgeInsets.all(10),
                  child:  TextFormField(    
                          // validator: (value){
                          //   if(value.isEmpty)
                          //   {
                          //     return 'លេខសំងាត់មិនអាចទទេ';
                          //   }
                          //   return null;
                          // },                                       
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ឈ្មោះអ្នកប្រើប្រាស់',                                               
                          ),
                        ),                  
                ),
                 
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    // validator: (value){
                    //   if(value.isEmpty)
                    //   {
                    //     return 'លេខសំងាត់មិនអាចទទេ';
                    //   }
                    //   return null;
                    // },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ពាក្យសម្ងាត់',   
                      errorText: _isvalidate ? 'គណនីយមិនត្រឹមត្រូវ!' : null,                
                    ),
                  ),
                ),
                // FlatButton(
                //   onPressed: (){
                //     //forgot password screen
                //   },
                //   textColor: Colors.blue,
                //   child: Text('Forgot Password'),
                // ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('ចូលប្រើប្រាស់',style: TextStyle(fontSize: 20),),
                      onPressed: () async {
                             final http.Response response = await http.post(
                          'http://gs.obpathom.com/api/auth/login', // url to get login api
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, String>{
                            'email': 'gs.info@mef.gov.kh',//nameController.text,
                            'password' : 'password'//passwordController.text,
                          }),
                        );                     
                        if (response.statusCode == 200) {                       
                           final user = User.fromJson(jsonDecode(response.body));
                           tokenkey =user.tokentype +" "+ user.accesstoken;
                           Navigator.pushReplacement( context,MaterialPageRoute(builder: (context) => new Dashboard()));
                        } else {
                          setState(() {
                            _isvalidate = true;
                          });
                        }                                         
                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        textColor: Colors.blue,                       
                        child: Text(
                          'មិនទាន់មានគណនី?',
                          style: TextStyle(fontSize: 17,decoration: TextDecoration.underline,),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}