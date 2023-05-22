import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jshon_data/Users_json_data/Model_class/Users_model.dart';

class Users_provider extends ChangeNotifier
{

  List json=[];
  List<UserModel> jsonDataList=[];

  Future<void> UsersDataParsing()
  async {
    String? jsonString=await rootBundle.loadString("assets/jsonData/Users_json_data.json");

    json=jsonDecode(jsonString);

    jsonDataList=json.map((e) => UserModel.fromJson(e)).toList();

    notifyListeners();
  }
}