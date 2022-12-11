import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String myurl = "https://apihomechef.antopolis.xyz/api/admin/";
fluttertose(String title, Color clr) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: clr,
      textColor: Colors.white,
      fontSize: 20.0);
}
