import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User_provider extends ChangeNotifier
{
  List<dynamic> userJson=[];

  Future<void> userJsonParsing()
  async {
    String jsonString= await rootBundle.loadString("assets/jsonData/user_Json_Data.json");

    userJson = jsonDecode(jsonString);

    notifyListeners();

  }
}