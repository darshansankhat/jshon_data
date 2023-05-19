import 'package:flutter/material.dart';
import 'package:jshon_data/user_Json_data/provider_Class/user_Json_Provider.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Json_provider>(context, listen: false);
    providerT = Provider.of<Json_provider>(context, listen: true);

    UproviderF = Provider.of<User_provider>(context, listen: false);
    UproviderT = Provider.of<User_provider>(context, listen: true);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    providerF!.postJsonParsing();
                    Navigator.pushNamed(context, "post");
                  },
                  child: Text("Post Data")),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    UproviderF!.userJsonParsing();
                    Navigator.pushNamed(context, "user");
                  },
                  child: Text("User Data")),
            ],
          ),
        ),
      ),
    );
  }
}
