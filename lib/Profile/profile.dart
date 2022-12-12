import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          children: [
            //1st part
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .13,
                            height: MediaQuery.of(context).size.height * .1,
                            color: Colors.transparent,
                            child: Image.network(
                                "https://cdn-icons-png.flaticon.com/512/2922/2922510.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Verified Account",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.work,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  "Work Station",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey.withOpacity(0.2),
                              indent: 48.0,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  " Notifications",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //1st part end

            Spacer(),
            //3rd part start
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                color: Colors.white,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Edit profile",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.withOpacity(0.2),
                      indent: 48.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
