import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumsService {
  String _url = "https://jsonplaceholder.typicode.com/albums";
  Future getResponse () async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_url));
      //print(response.toString());
      responseJson = jsonDecode(response.body);
    } catch (error) {
      print(error);
      return null;
    }
    return responseJson;
  }
}