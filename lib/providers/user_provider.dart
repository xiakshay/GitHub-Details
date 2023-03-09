import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:github_details/model/user.dart';
import 'package:http/http.dart' as http;
import '../utils/api.dart';

class UserProvider with ChangeNotifier {
  late User user;

  Future<void> getUserProfile(String username) async {
    final url = Uri.parse('${Api.api}/users/$username');

    try {
      final response =
          await http.get(url, headers: {'Authorization': 'token ${Api.token}'});
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      user = User(
          username: responseData['login'],
          imageUrl: responseData['avatar_url'],
          followers: responseData['followers'],
          followings: responseData['followings'],
          publicRepo: responseData['repos']);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
