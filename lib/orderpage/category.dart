import 'package:ecommerce/Modelclass/categorymodelclass.dart';
import 'package:ecommerce/Provider/categoryprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({super.key});

  @override
  State<Categorylist> createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  @override
  void initState() {
    Provider.of<Categoryprovider>(context, listen: false).getcategorydata();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Categorylist = Provider.of<Categoryprovider>(context).categorylist;
    return SafeArea(
      child: Scaffold(
        body: Categorylist == null
            ? CircularProgressIndicator()
            : GridView.builder(
                shrinkWrap: true,
                itemCount: Categorylist.length,
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
                                      Colors.deepPurple.shade300,
                                      Colors.black26,
                                      Colors.deepOrange.shade300
                                    ]
                                  : [
                                      Colors.blue.shade300,
                                      Colors.deepOrange,
                                      Colors.black26,
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Stack(children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://apihomechef.antopolis.xyz/images/${Categorylist[index].image}",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      child: Image.network(
                                        "https://apihomechef.antopolis.xyz/images/${Categorylist[index].icon}",
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ]),
                            ),
                            Text(
                              "Name:${Categorylist[index].name}",
                              style: fctn(14, Colors.white, FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ID:${Categorylist[index].id} ",
                              style: fctn(14, Colors.black, FontWeight.bold),
                            ),
                            Spacer()
                          ],
                        )),
                  );
                })),
      ),
    );
  }

  fctn(double size, Color clr, [FontWeight? fw]) {
    return TextStyle(fontSize: size, color: clr, fontWeight: fw);
  }
}
