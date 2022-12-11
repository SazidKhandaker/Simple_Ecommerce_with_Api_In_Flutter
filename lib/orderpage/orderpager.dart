import 'package:ecommerce/common_Function/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  List mylist = [];
  getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String getlink = "${myurl}all/orders";
    var response = await http.get(Uri.parse(getlink));
    sharedPreferences.getString('token');
    //print("Shareprefereance code: ${sharedPreferences.getString('token')}");

    print(response.body);
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(),
    );
  }
}
