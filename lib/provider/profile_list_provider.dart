import 'dart:convert';

import 'package:codefury/model/invest_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiServices.dart';
import '../model/profile_model.dart';

class ProfileListProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<ProfileModel> _productList = [];

  List<ProfileModel> get productList {
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
    List<ProfileModel> productList = [];
    print(responseData.length);
    if (responseData.length != 0) {
      try {
        for (int i = 0; i < responseData.length; i++) {
          ProfileModel repo = ProfileModel(
            contactNo: int.parse(responseData[i]['contact_no'].toString()),
            email: responseData[i]['email'],
            typeOfAccount: responseData[i]['type_of_account'],
            name: responseData[i]['name'],
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
