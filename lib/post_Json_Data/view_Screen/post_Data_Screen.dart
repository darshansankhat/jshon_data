import 'package:flutter/material.dart';
import 'package:jshon_data/post_Json_Data/provider_screen/json_Provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Post_data extends StatefulWidget {
  const Post_data({Key? key}) : super(key: key);

  @override
  State<Post_data> createState() => _Post_dataState();
}

class _Post_dataState extends State<Post_data> {

  Json_provider? providerF;
  Json_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Json_provider>(context,listen: false);
    providerT=Provider.of<Json_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back,color: Colors.black,),),
          centerTitle: true,
          title: Text(
            "Post Data",
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
                            "ID :- ${providerT!.json[index]["id"]}",
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
                              color: Colors.black, blurRadius: 3, offset: Offset(0, 1)),
                        ],
                      ),
                      child: Column(
                        children: [
                          inerData(0,"User ID :- \n    ${providerT!.json[index]["userId"]}"),
                          inerData(1,"title :- \n    ${providerT!.json[index]["title"]}"),
                          inerData(2,"body :- \n    ${providerT!.json[index]["body"]}"),
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

  Widget inerData(int c,String data)
  {
    return Container(
      width: 100.w,
      color: c == 0 || c==2
          ? Colors.blue.shade50
          : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 5,top: 5),
        child: Text("$data",style: TextStyle(fontSize: 18,color: Colors.black),),
      ),
    );
}
}
