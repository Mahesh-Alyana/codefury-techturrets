import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiServices.dart';
import '../model/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late ProfileModel _productList;

  ProfileModel get productList {
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
    ProfileModel productList;

    ProfileModel repo = ProfileModel(
      contactNo: int.parse(responseData['contact_no'].toString()),
      email: responseData['email'],
      typeOfAccount: responseData['type_of_account'],
      name: responseData['name'],
    );
    productList = repo;

    _productList = productList;
    notifyListeners();
  }
}
