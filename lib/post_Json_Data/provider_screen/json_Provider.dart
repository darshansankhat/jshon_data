import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Json_provider extends ChangeNotifier
{

  List<dynamic> json=[];

   Future<void> postJsonParsing()
   async {
     String jsonStrin = await rootBundle.loadString("assets/jsonData/json_Data.json");

     json=jsonDecode(jsonStrin);

     notifyListeners();
   }
}