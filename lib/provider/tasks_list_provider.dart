import 'dart:convert';

import 'package:codefury/model/invest_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiServices.dart';
import '../model/feed_model.dart';

class TasksListProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<FeedModel> _productList = [];

  List<FeedModel> get productList {
    return [..._productList];
  }

  Future getProductList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var response = await http.get(
      Uri.parse('${ApiConfig.host}/main/investorsapi/'),
      headers: {"Authorization": "JWT $token"},
    );

    final responseData = json.decode(response.body) as List<dynamic>;
    List<FeedModel> productList = [];
    // ignore: avoid_print
    print(responseData.length);
    if (responseData.isNotEmpty) {
      try {
        for (int i = 0; i < responseData.length; i++) {
          FeedModel repo = FeedModel(
            description: responseData[i]['description'],
            id: responseData[i]['id'],
            like: responseData[i]['like'],
            mediaFiles: responseData[i]['mediaFiles'],
            title: responseData[i]['title'],
          );
          productList.add(repo);
        }
      } catch (e) {
        print(e);
      }
    }

    print(productList);

    _productList = productList;
    notifyListeners();
  }
}
