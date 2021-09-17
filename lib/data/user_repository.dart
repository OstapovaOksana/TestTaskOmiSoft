import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testtaskomisoft/data/api_result.dart';
import 'package:http/http.dart' as http;
import 'network_manager.dart';

class UserRepository {
  NetworkManager _networkManager = NetworkManager();

  Future<ApiResult<String>> signInViaEmailPassword(
      String email, String password) async {
    if (!await _networkManager.hasConnection()) {
      return ApiResult(error: ApiError.NO_NETWORK);
    }
    try {
      String token = await http.post(
        Uri.parse(url),
        body: json.encode({"email": email, "password": password}),
        headers: {'content-type': 'application/json'},
      ).then((response) => json.decode(response.body)['token']);
      return ApiResult(data: token);
    } catch (_) {
      return ApiResult(error: ApiError.SERVER_REQUEST_FAILED);
    }
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTokenString, token);
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(userTokenString);
    return token;
  }

  clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userTokenString);
  }

  static const String userTokenString = 'user_token';
  static const String url = 'https://site.ualegion.com/api/v1/security/login';
}
