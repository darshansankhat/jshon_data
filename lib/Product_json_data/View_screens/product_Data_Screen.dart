import 'package:flutter/material.dart';
import 'package:jshon_data/Product_json_data/Provider_class/Product_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Product_data extends StatefulWidget {
  const Product_data({Key? key}) : super(key: key);

  @override
  State<Product_data> createState() => _Product_dataState();
}

class _Product_dataState extends State<Product_data> {

  Product_provider? providerF;
  Product_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Product_provider>(context,listen: false);
    providerT=Provider.of<Product_provider>(context,listen: true);

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
            "Product Data",
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
                            "ID :-    ${providerT!.productList[index].id}",
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
                          inerData(0, "User ID :-    ${providerT!.productList[index].userId}"),
                          inerData(1, "Date :-    ${providerT!.productList[index].date}"),
                          // inerData(0, "Products :-    \n        ProductID :-    ${providerT!.productList[index].products}"),
                          inerData(3, "V :-    ${providerT!.productList[index].v}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: providerT!.json.length,
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
