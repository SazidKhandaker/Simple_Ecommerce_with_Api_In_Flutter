import 'package:ecommerce/Provider/productprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  @override
  void initState() {
    Provider.of<Productprovider>(context, listen: false).getproductlistdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productlist = Provider.of<Productprovider>(context).productlist;
    return SafeArea(
      child: Scaffold(
          body: productlist == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: productlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Container(
                      child: Text("${productlist[index].name}"),
                    );
                  }))),
    );
  }
}
