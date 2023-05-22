import 'package:flutter/material.dart';
import 'package:jshon_data/Product_json_data/Provider_class/Product_provider.dart';
import 'package:jshon_data/user_Json_data/provider_Class/user_Json_Provider.dart';
import 'package:provider/provider.dart';

import '../Users_json_data/Provider_class/Users_provider.dart';
import '../post_Json_Data/provider_screen/json_Provider.dart';

class Json_home extends StatefulWidget {
  const Json_home({Key? key}) : super(key: key);

  @override
  State<Json_home> createState() => _Json_homeState();
}

class _Json_homeState extends State<Json_home> {
  Json_provider? providerF;
  Json_provider? providerT;

  User_provider? UproviderF;
  User_provider? UproviderT;

  Product_provider? PproviderF;
  Product_provider? PproviderT;

  Users_provider? uproviderF;
  Users_provider? uproviderT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Json_provider>(context, listen: false);
    providerT = Provider.of<Json_provider>(context, listen: true);

    UproviderF = Provider.of<User_provider>(context, listen: false);
    UproviderT = Provider.of<User_provider>(context, listen: true);

    PproviderF = Provider.of<Product_provider>(context, listen: false);
    PproviderT = Provider.of<Product_provider>(context, listen: true);

    uproviderF = Provider.of<Users_provider>(context, listen: false);
    uproviderT = Provider.of<Users_provider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Choice Data",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    providerF!.postJsonParsing();
                    Navigator.pushNamed(context, "post");
                  },
                  child: Text("Post Data")),

              ElevatedButton(
                  onPressed: () {
                    UproviderF!.userJsonParsing();
                    Navigator.pushNamed(context, "user");
                  },
                  child: Text("User Data")),

              ElevatedButton(
                  onPressed: () {
                    PproviderF!.productJsonParsing();
                    Navigator.pushNamed(context, "product");
                  },
                  child: Text("Product Data")),

              ElevatedButton(
                  onPressed: () {
                    uproviderF!.UsersDataParsing();
                    Navigator.pushNamed(context, "Users");
                  },
                  child: Text("Users Data")),
            ],
          ),
        ),
      ),
    );
  }
}
