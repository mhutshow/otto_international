import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:otto_int/ApiService/FetchPosts.dart';

class ApiService{
  static var client = http.Client();
  static String url= "https://otto.letsflutter.com/";

  static Future<bool> authentication(String username, String password)async{
  Map<String , String> requestHeader = {'Content-type' : 'application/x-www-form-urlencoded'};
  var response = await client.post(Uri.parse("$url/wp-json/jwt-auth/v1/token"), headers: requestHeader, body: {'username':username, 'password':password,});

  if(response.statusCode==200){
     var jsonResponse=response.body;
     print(jsonResponse);
    }
  //If credential is ok then the status code is 200. So it will return try only with valid email password
  return response.statusCode==200;
  }

  static Future<String> authorInfo(int authorId)async{
    String authorName='';
    var response = await client.get(Uri.parse("$url/wp-json/wp/v2/users/$authorId"));
    if(response.statusCode==200){
      var jsonResponse=response.body;
      var decoded=jsonDecode(jsonResponse);
      authorName=decoded['name'];
    }
    return authorName;
  }

  static Future<List<WpData>> fetchPosts()async{
    List<WpData> data=[];
    var response = await client.get(Uri.parse("$url/wp-json/wp/v2/posts/?"));
    if(response.statusCode==200){
      var jsonResponse=response.body;
      var decoded=jsonDecode(jsonResponse);
      for (int i=0 ; i< decoded.length ; i++){
        data.add(WpData(date: decoded[i]['date'],title: decoded[i]['title']['rendered'] ,author: decoded[i]['author'], content:decoded[i]['content']['rendered']));
      }
    }
    return data;
  }


}