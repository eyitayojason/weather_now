import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    log(
      "   <<<<Requesting>>>>>>    " + response.request.toString(),
    );

    if (response.statusCode == 200) {
      log(response.body);
      String data = response.body;

      return jsonDecode(data);
    } else {
      print("<<<<Response error>>>>>>     ${response.statusCode}"
          "${response.reasonPhrase.toString()}");
    }
  }
}
