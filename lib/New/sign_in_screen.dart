import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_gather_application/Clippers/curved_bottom_clipper.dart';
import 'package:we_gather_application/New/forget_password_screen.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';
import 'package:we_gather_application/New/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:we_gather_application/Screens/user_profile_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _email, _password;
  String token;
  Future loginUser() async {
    var APIURL = Uri.parse('https://wanderguide.net/api/auth/login');
    Map mapData = {
      'email': emailController.text,
      'password': passController.text,
    };
    http.Response response = await http.post(APIURL, body: mapData);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      token = data['remember_token'];
      print(token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('remember_token', token);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      // token = data['data']['client']['remember_token'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('remember_token', token);
      // Get.to(() => ControlView(args: UserToken(token)));
      // print(token);
      // }else if (response.statusCode == 404) {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   var verifyCode = prefs.getString('verification_code');
      //   print(verifyCode);
      //   Get.to(() => VerificationPageView(args: UserData(emailController.text,verifyCode)));
      // }else {
      //   print("user is not in our database");
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.translate(
                    offset: Offset(160, 130),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.only(left: 20,right: 20),
                    //       child: TextFormField(
                    //         cursorColor:Color(0xFFFE6B02) ,
                    //         decoration: InputDecoration(
                    //
                    //           labelText: 'Sign In as',
                    //           labelStyle: TextStyle(color: Color(0xFFFE6B02),fontSize: 18,fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ),
                    //     Transform.translate(
                    //       offset: Offset(200,10),
                    //       child: DropdownButton<String>(
                    //         icon: CircleAvatar(
                    //           radius: 15,
                    //           backgroundColor: Color(0xFFFE6B02),
                    //             child: Icon(Icons.arrow_downward_rounded,color: Colors.white,)),
                    //         underline: SizedBox(),
                    //         iconSize: 20.0,
                    //         items: <String>['user', 'organizer', 'admin'].map((String value) {
                    //           return new DropdownMenuItem<String>(
                    //             value: value,
                    //             child: new Text(value),
                    //           );
                    //         }).toList(),
                    //         onChanged: (_) {},
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: TextFormField(
                        controller: emailController,
                        cursorColor: Color(0xFFFE6B02),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        onSaved: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: TextFormField(
                        controller: passController,
                        cursorColor: Color(0xFFFE6B02),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        onSaved: (value) {
                          _password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            '|',
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPasswordScreen()));
                              },
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                    fontSize: 17,
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .09,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * .4,
                      padding: const EdgeInsets.all(0.0),
                      height: 40,
                      child: RaisedButton(
                        color: Colors.grey,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            loginUser();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .4,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .03),
                        child: OutlinedButton(
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(color: Colors.blue),
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                        )),
                  ],
                ),
              ),
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
