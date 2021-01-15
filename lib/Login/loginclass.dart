

class User{
  int code;
  String message;
  String accesstoken;
  String tokentype;

  User({this.code,this.message,this.accesstoken,this.tokentype});
  
   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      code: json['code'],
      message: json['message'],
      accesstoken: json['access_token'],
      tokentype: json['token_type'],
    );
  }
}