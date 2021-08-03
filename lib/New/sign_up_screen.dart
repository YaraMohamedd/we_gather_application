import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:we_gather_application/Clippers/top_wave_clipper.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';
import 'package:we_gather_application/New/sign_in_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File _file;

  Future getFile() async {
    File file = await FilePicker.getFile();

    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath, context) async {
    String fileName = basename(filePath.path);
    print("file base name:$fileName");
   
    try {
      FormData formData = new FormData.fromMap({
        'fname': fnameController.text,
        'lname': lnameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passController.text,
        'img': await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio()
          .post("https://wanderguide.net/api/register", data: formData);
      print("File upload response: $response");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("expectation Caugch: $e");
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final key = GlobalKey<ScaffoldState>();
  String _fname, _password, _phone, _email, _lname;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  bool isChecked = false;
  //variable for choosed file

  // Io.File uploadimage; //variable for choosed file
  //
  //  Future<void> chooseImage() async {
  //    var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
  //    //set source: ImageSource.camera to get image from camera
  //    setState(() {
  //      uploadimage = choosedimage;
  //    });
  //  }
  // Future registrationUser()  async{
  //
  //   var APIURL = Uri.parse('https://wanderguide.net/api/register');
  //   List<int> imageBytes = uploadimage.readAsBytesSync();
  //   String baseimage = base64Encode(imageBytes);
  //   final decodedBytes =base64Decode(baseimage);
  // var file =Io.File ('${uploadimage}');
  //  file.writeAsBytesSync(decodedBytes);
  //   Map mapData ={
  //     'fname':fnameController.text,
  //     'lname':lnameController.text,
  //     'email':emailController.text,
  //     'phone':phoneController.text,
  //     'password':passController.text,
  //     'img':file,
  //   };
  //   http.Response response = await http.post(APIURL,body:mapData);
  //   if(response.statusCode == 200  ){
  //     var data = jsonDecode(response.body);
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
  //     print(data);
  //   }else{
  //     print("x");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Transform.translate(
                offset: Offset(0, 70),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 130, right: 20, left: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .75,
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(left: 20,right: 20),
                            //   child: TextFormField(
                            //     cursorColor:Color(0xFFFE6B02) ,
                            //     decoration: InputDecoration(
                            //
                            //       labelText: 'SignIn as',
                            //       labelStyle: TextStyle(color: Color(0xFFFE6B02),fontSize: 18),
                            //     ),
                            //   ),
                            // ),
                            TextFormField(
                              cursorColor: Color(0xFFFE6B02),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              controller: fnameController,
                              onSaved: (value) {
                                _fname = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '*Required';
                                }
                                return null;
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: TextFormField(
                                cursorColor: Color(0xFFFE6B02),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                controller: lnameController,
                                onSaved: (value) {
                                  _lname = value;
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
                              margin: EdgeInsets.only(
                                top: 30,
                              ),
                              child: TextFormField(
                                cursorColor: Color(0xFFFE6B02),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                controller: emailController,
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
                              margin: EdgeInsets.only(top: 30),
                              child: TextFormField(
                                cursorColor: Color(0xFFFE6B02),
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                controller: phoneController,
                                onSaved: (value) {
                                  _phone = value;
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
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              child: TextFormField(
                                cursorColor: Color(0xFFFE6B02),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                controller: passController,
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
                              margin:
                                  EdgeInsets.only(left: 20, right: 10, top: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.arrow_circle_up_outlined,
                                          color: Color(0xFFFE6B02),
                                          size: 30,
                                        ),
                                        onTap: () {
                                          getFile();
                                        },
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Upload image',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      //show image here after choosing image
                                      child: _file == null
                                          ? Container()
                                          : //if uploadimage is null then show empty container
                                          Container(
                                              //elese show image here
                                              child: SizedBox(
                                                  height: 100,
                                                  child: Image.file(
                                                      _file) //load image from file
                                                  ))),
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * .4,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .03,
                                ),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _uploadFile(_file, context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  },
                                )),

                            // CheckboxListTile(
                            //   title: Text(
                            //       "I've read and accept terms & conditions",
                            //       style: TextStyle(
                            //         color: Color(0xFFFE6B02),
                            //         fontSize: 13,
                            //       )), //    <-- label
                            //   value: false,
                            //   onChanged: (newValue) {},
                            //   controlAffinity:
                            //       ListTileControlAffinity.leading,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     // boxShadow: [
                //     //   // BoxShadow(
                //     //   //   color: Color(0xFFfe9c56),
                //     //   //   blurRadius: 2.0,
                //     //   //   spreadRadius: 4.0,
                //     //   //   offset: Offset(
                //     //   //     3.0,
                //     //   //     2.0,
                //     //   //   ),
                //     //   // ),
                //     // ],
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   width: MediaQuery.of(context).size.width * .4,
                //   margin: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * .88,
                //       left: MediaQuery.of(context).size.width * .3),
                //   padding: const EdgeInsets.all(0.0),
                //   height: 40,
                //   child: RaisedButton(
                //     color: Color(0xFFFE4B02),
                //     shape: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide.none),
                //     onPressed: () {
                //       if (_formKey.currentState.validate()) {
                //         //_uploadFile(_file, context);
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => HomePage()));
                //       }
                //     },
                //     child: Text(
                //       'Register',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // )
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
    pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
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
