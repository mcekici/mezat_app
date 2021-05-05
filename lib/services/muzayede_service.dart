
import 'package:mezat_app/services/base.dart';
import 'package:http/http.dart' as http;
class MuzayedeService{
  static String url =  Base.url + "muzayede/";

  static Future getall(){
    var uri = url + "getall";
    return http.get(Uri.http(Base.server,uri));
  }
}