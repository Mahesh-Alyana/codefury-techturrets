import 'dart:convert';

import 'package:codefury/model/invest_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiServices.dart';

class InvestorListProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<InvestModel> _productList = [];

  List<InvestModel> get productList {
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
    List<InvestModel> productList = [];
    print(responseData.length);
    if (responseData.length != 0) {
      try {
        for (int i = 0; i < responseData.length; i++) {
          InvestModel repo = InvestModel(
            investorContactNo: responseData[i]['investor_contact_no'],
            investorEmail: responseData[i]['investor_email'],
            money: responseData[i]['money'],
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
