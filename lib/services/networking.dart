import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandler {
  NetworkHandler({this.url});

  final String url;

  Future getData() async {
    var urllink = Uri.parse(url);
    http.Response response = await http.get(urllink);

    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }
}
