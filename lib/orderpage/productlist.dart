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
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: index % 2 == 0
                                    ? [
                                        Colors.red.shade100,
                                        Colors.black26,
                                        Colors.amber.shade300
                                      ]
                                    : [
                                        Colors.green.shade300,
                                        Colors.black26,
                                        Colors.deepOrange
                                      ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                "Name:${productlist[index].name}",
                                style: fctn(16, Colors.white, FontWeight.bold),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                backgroundImage: index % 2 == 0
                                    ? NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg")
                                    : NetworkImage(
                                        "https://cdn-almjc.nitrocdn.com/aZYyrACOqPKwqacflNAAVPArFRYGkpZe/assets/static/optimized/rev-76f8472/wp-content/uploads/2020/02/46d82e1a0b0100936591de3958f3408d.Chinese-food.jpg"),
                              ),
                              Spacer(),
                              Text(
                                "Price:${productlist[index].price![0].originalPrice} taka",
                                style: fctn(16, Colors.black, FontWeight.bold),
                              ),
                              Spacer()
                            ],
                          )),
                    );
                  }))),
    );
  }

  fctn(double size, Color clr, [FontWeight? fw]) {
    return TextStyle(fontSize: size, color: clr, fontWeight: fw);
  }
}
