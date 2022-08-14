import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiServices.dart';
import '../model/feed_model.dart';
import '../model/profile_model.dart';

class FeedProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late FeedModel _productList;

  FeedModel get productList {
    return _productList;
  }

  Future getProductList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
      Uri.parse('${ApiConfig.host}/main/cart/'),
      headers: {"Authorization": "JWT $token"},
    );

    final responseData = json.decode(response.body);
    FeedModel productList;

    FeedModel repo = FeedModel(
      description: responseData['description'],
      id: responseData['id'],
      like: responseData['like'],
      mediaFiles: responseData['mediaFiles'],
      title: responseData['title'],
    );
    productList = repo;

    _productList = productList;
    notifyListeners();
  }
}
