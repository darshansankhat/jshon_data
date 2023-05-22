import 'package:flutter/material.dart';
import 'package:jshon_data/Users_json_data/Provider_class/Users_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Users_data extends StatefulWidget {
  const Users_data({Key? key}) : super(key: key);

  @override
  State<Users_data> createState() => _Users_dataState();
}

class _Users_dataState extends State<Users_data> {
  Users_provider? providerF;
  Users_provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Users_provider>(context, listen: false);
    providerT = Provider.of<Users_provider>(context, listen: true);

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
            "Users Data",
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
                            "ID :-    ${providerT!.jsonDataList[index].id}",
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
                              'Name :-    \n        FirstName :-    ${providerT!.jsonDataList[index].name!.firstName}\n        LastName :-    ${providerT!.jsonDataList[index].name!.lastName}'),
                          inerData(1,
                              'UserName :-    ${providerT!.jsonDataList[index].username}'),
                          inerData(0,
                              'Password :-    ${providerT!.jsonDataList[index].password}'),
                          inerData(1,
                              'Email :-    ${providerT!.jsonDataList[index].email}'),
                          inerData(0,
                              'Phone :-    ${providerT!.jsonDataList[index].phone}'),
                          inerData(
                              1, 'V :-    ${providerT!.jsonDataList[index].v}'),
                          inerData(0,
                              'Address :-    \n        City :-    ${providerT!.jsonDataList[index].address!.city}\n        Street :-    ${providerT!.jsonDataList[index].address!.street}\n        Number :-    ${providerT!.jsonDataList[index].address!.number}\n        ZipCode :-    ${providerT!.jsonDataList[index].address!.zipcode}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: providerT!.jsonDataList.length,
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
