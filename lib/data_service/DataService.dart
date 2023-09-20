import 'package:pdthang/model/Welcome.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://10.22.186.86:8888/api/v1";
  Future<List<WelcomeModel>> welcome() async {
    String subUrl = "/welcome";
    http.Response response = await http.get(Uri.parse(baseUrl+subUrl));
    try{
      if(response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => WelcomeModel.fromJson(e)).toList();
      }
    } catch(e) {
      print(e);
    }
    return <WelcomeModel>[];
  }
}