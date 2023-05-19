import 'package:flutter/material.dart';
import 'package:jshon_data/user_Json_data/provider_Class/user_Json_Provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class User_data extends StatefulWidget {
  const User_data({Key? key}) : super(key: key);

  @override
  State<User_data> createState() => _User_dataState();
}

class _User_dataState extends State<User_data> {
  User_provider? providerF;
  User_provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<User_provider>(context, listen: false);
    providerT = Provider.of<User_provider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "User Data",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    //line
                    Stack(
                      alignment: Alignment(-0.8, 0),
                      children: [
                        Container(
                          height: 0.3.h,
                          width: 100.w,
                          color: Colors.amber,
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          color: Colors.amber.shade50,
                          alignment: Alignment.center,
                          child: Text(
                            "ID :- ${providerT!.userJson[index]["id"]}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    //data
                    SizedBox(height: 20),
                    Container(
                      width: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 3,
                              offset: Offset(0, 1)),
                        ],
                      ),
                      child: Column(
                        children: [
                          inerData(0,
                              " ID :-   ${providerT!.userJson[index]["id"]}"),
                          inerData(1,
                              " Name :-   ${providerT!.userJson[index]["name"]}"),
                          inerData(2,
                              " User Name :-   ${providerT!.userJson[index]["username"]}"),
                          inerData(3,
                              " Email :-   ${providerT!.userJson[index]["email"]}"),
                          inerData(4,
                              " Address :-   \n    Street :-   ${providerT!.userJson[index]["address"]['street']}\n    Suite :-    ${providerT!.userJson[index]["address"]['suite']}\n    Geo :-     \n        Lat :-    ${providerT!.userJson[index]["address"]["geo"]["lat"]}\n        Lng :-   ${providerT!.userJson[index]["address"]["geo"]["lng"]}"),
                          inerData(5,
                              " Phone :-   ${providerT!.userJson[index]["phone"]}"),
                          inerData(6,
                              " Website :-   ${providerT!.userJson[index]["website"]}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: providerT!.userJson.length,
        ),
      ),
    );
  }

  Widget inerData(int c, String data) {
    return Container(
      width: 100.w,
      color: c % 2 == 0 ? Colors.blue.shade50 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5),
        child: Text(
          "$data",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
