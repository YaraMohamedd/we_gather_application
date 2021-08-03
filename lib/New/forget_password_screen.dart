import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:we_gather_application/Clippers/curved_bottom_clipper.dart';
import 'package:we_gather_application/New/reset_password_screen.dart';
import 'package:we_gather_application/New/sign_up_screen.dart';
import 'package:http/http.dart' as http;
TextEditingController emailController = TextEditingController();
class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}
class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future forgetPass() async {
    var APIURL = Uri.parse('https://wanderguide.net/api/forgetpassword');
    Map mapData = {
      'email': emailController.text,
    };
    http.Response response = await http.post(APIURL, body: mapData);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ResetPasswordScreen(
            args: UserEmail(emailController.text),
          )));
      print(data);
    }
  }

  String _email;
  String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.translate(
                        offset: Offset(100, 150),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 350, right: 20, left: 20),
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    elevation: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 15),
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                child: TextFormField(
                                  controller: emailController,
                                  onSaved: (value) {
                                    _email = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    }
                                    return null;
                                  },
                                  cursorColor: Color(0xFFFE6B02),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
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
                Transform.translate(
                  offset: Offset(100, MediaQuery.of(context).size.height * .65),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width * .45,
                    padding: const EdgeInsets.all(0.0),
                    height: 40,
                    child: RaisedButton(
                      color: Color(0xFFFE4B02),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          forgetPass();
                        }
                      },
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Send reset link',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const List<Color> orangeGradients = [
  Color(0xFFfeac72),
  Color(0xFFfe9c56),
];
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
