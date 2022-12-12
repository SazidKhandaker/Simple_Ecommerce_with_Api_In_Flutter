import 'package:ecommerce/Modelclass/Orderalll.dart';
import 'package:ecommerce/common_Function/httpfctn.dart';
import 'package:ecommerce/orderpage/orderpager.dart';
import 'package:flutter/material.dart';

class Orderprovider with ChangeNotifier {
  List<OrderModelclass> mylist = [];

  getprovideroforderlist() async {
    mylist = await httpclass.orderclassdata();
    notifyListeners();
  }
}
