import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jshon_data/user_Json_data/model_Class/Product_model.dart';

class Product_provider extends ChangeNotifier
{

  List json=[];
  List<Productmodel> productList=[];
  
  Future<void> productJsonParsing()
  async {
    String jsonString = await rootBundle.loadString("assets/jsonData/product_json_Data.json");

    json = jsonDecode(jsonString);

    productList=json.map((e) => Productmodel.fromjson(e)).toList();

    notifyListeners();
  }
  
}