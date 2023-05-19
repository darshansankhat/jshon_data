import 'package:flutter/material.dart';
import 'package:jshon_data/json_home/json_Home_Screen.dart';
import 'package:jshon_data/post_Json_Data/provider_screen/json_Provider.dart';
import 'package:jshon_data/post_Json_Data/view_Screen/post_Data_Screen.dart';
import 'package:jshon_data/user_Json_data/provider_Class/user_Json_Provider.dart';
import 'package:jshon_data/user_Json_data/view_Screen/user_Data_Screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Json_provider(),),
        ChangeNotifierProvider(create: (context) => User_provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => Json_home(),
          "post":(context) => Post_data(),
          "user":(context) => User_data(),
        },
      ),
    ),)
  );
}