import 'package:ecommerce/Profile/profile.dart';
import 'package:ecommerce/orderpage/category.dart';
import 'package:ecommerce/orderpage/orderpager.dart';
import 'package:ecommerce/orderpage/productlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  fctn() {
    setState(() {
      _globalKey.currentState?.openDrawer();
    });
  }

  int cuerrrentindex = 0;
  List selectindex = [Orderpage(), Productlist(), Categorylist()];
  selectfctn(index) {
    setState(() {
      cuerrrentindex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Profile(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: fctn,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.red.shade300,
                      Colors.purple.shade200,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
            ),
          ),
          title: Text("MY orderpage"),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
          ],
          onTap: selectfctn,
          selectedItemColor: Colors.amber[800],
          currentIndex: cuerrrentindex,
        ),
        body: selectindex[cuerrrentindex],
      ),
    );
  }
}
