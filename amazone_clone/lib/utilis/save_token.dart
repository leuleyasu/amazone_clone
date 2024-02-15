import 'package:shared_preferences/shared_preferences.dart';


void setToken(String token) async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString("token", token);

}

Future <String> getToken() async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
final String? authToken=  prefs.getString("token");
if (authToken!=null) {
  return authToken;
  
}
return '';
}