import 'package:ecommerce/Provider/categoryprovider.dart';
import 'package:ecommerce/Provider/orderprovider.dart';
import 'package:ecommerce/Provider/productprovider.dart';
import 'package:ecommerce/SplaseScreen/splashsreen.dart';
import 'package:ecommerce/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Orderprovider())),
        ChangeNotifierProvider(create: ((context) => Productprovider())),
        ChangeNotifierProvider(create: ((context) => Categoryprovider())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splashscreendemo(),
      ),
    );
  }
}
