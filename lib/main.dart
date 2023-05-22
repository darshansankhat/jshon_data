import 'package:flutter/material.dart';
import 'package:jshon_data/Product_json_data/Provider_class/Product_provider.dart';
import 'package:jshon_data/Product_json_data/View_screens/product_Data_Screen.dart';
import 'package:jshon_data/Users_json_data/View_screen/Users_data.dart';
import 'package:jshon_data/json_home/json_Home_Screen.dart';
import 'package:jshon_data/post_Json_Data/provider_screen/json_Provider.dart';
import 'package:jshon_data/post_Json_Data/view_Screen/post_Data_Screen.dart';
import 'package:jshon_data/user_Json_data/provider_Class/user_Json_Provider.dart';
import 'package:jshon_data/user_Json_data/view_Screen/user_Data_Screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Users_json_data/Provider_class/Users_provider.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Json_provider(),),
        ChangeNotifierProvider(create: (context) => User_provider(),),
        ChangeNotifierProvider(create: (context) => Product_provider(),),
        ChangeNotifierProvider(create: (context) => Users_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => Json_home(),
          "post":(context) => Post_data(),
          "user":(context) => User_data(),
          "product":(context) => Product_data(),
          "Users":(context) => Users_data(),
        },
      ),
    ),)
  );
}