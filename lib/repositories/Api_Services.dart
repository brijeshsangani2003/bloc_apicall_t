import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum ApiCallType {
  get,
  post,
}

class NetworkCall {
  Future<List<dynamic>?> handleApi({
    required String endpoint,
    Map<String, dynamic> params = const {},
    ApiCallType callType = ApiCallType.get,
  }) async {
    late Response response;
    final url = endpoint;

    switch (callType) {
      case ApiCallType.get:
        response = await http.get(
          Uri.parse(url),
        );
        break;

      case ApiCallType.post:
        response = await http.post(
          Uri.parse(url),
        );
        break;
    }
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized user');
    } else {
      return null;
    }
  }
}
