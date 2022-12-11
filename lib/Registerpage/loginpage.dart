import 'dart:convert';

import 'package:ecommerce/Registerpage/signuppage.dart';
import 'package:ecommerce/common_Function/common.dart';
import 'package:ecommerce/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool isloading = false;

  postdata() async {
    try {
      setState(() {
        isloading = true;
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String mylink = "${myurl}sign-in";
      var map = Map<String, dynamic>();
      map['email'] = emailcontroller.text.toString();
      map['password'] = passwordcontroller.text.toString();
      var response = await http.post(Uri.parse(mylink), body: map);
      var data = jsonDecode(response.body);
      //print("Assess token ${data['access_token']}");
      setState(() {
        isloading = false;
      });
      if (data['access_token'] != null) {
        sharedPreferences.setString('token', data['access_token']);
        sharedPreferences.get('token');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Homepage()),
            (route) => false);
      } else {
        fluttertose("Password and email does not match", Colors.greenAccent);
      }
    } catch (e) {
      print("The error :${e}");
    }
  }

  @override
  void initState() {
    postdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isloading == true,
        opacity: 0.5,
        blur: 0.5,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1647642891405-fc8a70cab67f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80"),
                  fit: BoxFit.fitHeight),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 25),
                      child: Text(
                        "Welcome To W-Shope!",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 23),
                      child: Text(
                        " Sign in to contiune.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _fromkey,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: TextFormField(
                                  controller: emailcontroller,
                                  validator: (value) {
                                    var emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value.toString());

                                    if (value!.isEmpty) {
                                      return "Fill up with your email";
                                    }
                                    if (emailValid == false) {
                                      return "Invalid email";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      labelText: "Email",
                                      hintText: "Enter your email",
                                      prefixIcon: Icon(Icons.email),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is empty";
                                    }
                                    if (value.length < 5) {
                                      return "Passowrd is too short";
                                    }
                                    if (value.length > 10) {
                                      return "Password is too long";
                                    }
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      labelText: "Password",
                                      hintText: "Enter your Password",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      suffix:
                                          Icon(Icons.remove_red_eye_rounded),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_fromkey.currentState!.validate()) {
                                    postdata();
                                  } else {
                                    print("Something is wrong");
                                  }
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color.fromARGB(255, 244, 185, 95)),
                                  child: Center(
                                      child: Text(
                                    'Login in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Center(
                          child: Text(
                            "Forgot password?",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black45),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signuppage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.width * .15,
                          width: MediaQuery.of(context).size.width * .85,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
