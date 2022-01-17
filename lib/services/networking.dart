import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future<dynamic> getData() async {
    http.Response weatherResponse = await http.get(Uri.parse(url));
    if (weatherResponse.statusCode == 200) {
      String data = weatherResponse.body;
      return jsonDecode(data);
    }
  }
}
