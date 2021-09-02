import 'package:http/http.dart' as http;

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


}