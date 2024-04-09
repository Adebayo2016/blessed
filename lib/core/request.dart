import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

class ApiRequest {
  Future<Map<String, dynamic>> getUserPaymentAuth(Map data) async {
    var headers = {
      'Authorization':
          'Bearer sk_test_3691e13a493ccce86d79f4c65f00e32d1322c278',
      'Content-Type': 'application/json',
    };
    final String? _baseUrl = "https://api.paystack.co/transaction/initialize";
    try {
      final responseData = await post(Uri.parse(_baseUrl!),
          headers: headers, body: jsonEncode(data));
      Map<String, dynamic> AuthUrl = await jsonDecode(responseData.body);
      log("this is the Auth data   " + AuthUrl.toString());
      return AuthUrl;
    } catch (e) {
      // Handle errors here, e.g., log the error or return a default value
      return {'error': e.toString()};
    }
  }





}
