import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/Modelclass/Orderalll.dart';
import 'package:ecommerce/common_Function/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class httpclass {
  static Future<Map<String, String>> tokenfctn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var gettoken = sharedPreferences.getString('token');
    Map<String, String> tokenmap = Map<String, String>();
    tokenmap['Accept'] = "Application/json";
    tokenmap['Authorization'] = "bearer ${gettoken}";

    return tokenmap;
  }

  static Future orderclassdata() async {
    OrderModelclass orderModelclass = OrderModelclass();
    List<OrderModelclass> myorderlist = [];

    String getlink = "${myurl}all/orders";

    var response = await http.get(Uri.parse(getlink),
        headers: await httpclass.tokenfctn());
    var data = jsonDecode(response.body);
    print("Data paisi-${data}");

    for (var i in data) {
      orderModelclass = OrderModelclass.fromJson(i);

      myorderlist.add(orderModelclass);
    }

    return myorderlist;
  }
}
