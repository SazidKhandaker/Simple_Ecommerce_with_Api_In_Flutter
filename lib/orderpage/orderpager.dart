import 'dart:convert';

import 'package:ecommerce/Modelclass/Orderalll.dart';
import 'package:ecommerce/Provider/orderprovider.dart';
import 'package:ecommerce/common_Function/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  OrderModelclass orderModelclass = OrderModelclass();

  @override
  void initState() {
    Provider.of<Orderprovider>(context, listen: false).getprovideroforderlist();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myorderlist = Provider.of<Orderprovider>(context).mylist;
    return Scaffold(
      body: myorderlist == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: myorderlist.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.height * 0.3,
                      color: index % 2 == 0
                          ? Colors.amber.shade100
                          : Colors.teal.shade100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 40,
                                    backgroundImage: index == 2
                                        ? NetworkImage(
                                            "https://cdn-icons-png.flaticon.com/512/2423/2423830.png")
                                        : index == 6
                                            ? NetworkImage(
                                                "https://cdn-icons-png.flaticon.com/512/2423/2423830.png")
                                            : NetworkImage(
                                                "https://cdn-icons-png.flaticon.com/512/163/163812.png",
                                              )),
                              ),
                              Text(
                                "Name:${myorderlist[index].user?.name}",
                                style: fctn(20, Colors.black, FontWeight.bold),
                              ),
                              Text(
                                "Id:${myorderlist[index].id}",
                                style: fctn(20, Colors.black, FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Quantity:${myorderlist[index].quantity}",
                                  style:
                                      fctn(18, Colors.green, FontWeight.bold)),
                              Text("Price:${myorderlist[index].price}",
                                  style: fctn(18, Colors.red, FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  fctn(double size, Color clr, [FontWeight? fw]) {
    return TextStyle(fontSize: size, color: clr, fontWeight: fw);
  }
}
