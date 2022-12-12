import 'package:ecommerce/Modelclass/Orderalll.dart';
import 'package:ecommerce/Modelclass/productmodelclass.dart';
import 'package:ecommerce/common_Function/httpfctn.dart';
import 'package:ecommerce/orderpage/orderpager.dart';
import 'package:flutter/material.dart';

class Productprovider with ChangeNotifier {
  List<ProductModelclass> productlist = [];

  getproductlistdata() async {
    productlist = await httpclass.productclassdata();
    notifyListeners();
  }
}
