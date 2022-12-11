import 'dart:async';

import 'package:ecommerce/Registerpage/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splashscreendemo extends StatefulWidget {
  const Splashscreendemo({super.key});

  @override
  State<Splashscreendemo> createState() => _SplashscreendemoState();
}

class _SplashscreendemoState extends State<Splashscreendemo> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
