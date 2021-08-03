import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:we_gather_application/Models/register_model.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
import 'package:we_gather_application/Widgets/textfield_widget.dart';

class ViewProfileData extends StatefulWidget {
  @override
  _ViewProfileDataState createState() => _ViewProfileDataState();
}

class _ViewProfileDataState extends State<ViewProfileData> {
  Future<http.Response> getprofileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    // Map data = {'token': token};
    // var body = json.encode(data);
    // var url = 'https://wanderguide.net/api/profile';
    // await http
    //     .post(
    //      url,
    //   body: body,
    // )
    //     .then((response) {
    //   print("Response status: ${response.statusCode}");
    //   print("Response body: ${response.body}");
    // });

    try {
      FormData formData = new FormData.fromMap({
        'token': token,
      });

      Response response = await Dio()
          .post("https://wanderguide.net/api/profile", data: formData);
      print("File upload response: $response");
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("expectation Caugch: $e");
    }
    // final newURI =
    //     Uri.https('www.wanderguide.net', '/api/profile', {'token': token});
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // http.Response response = await http.post(newURI, body: headers);
    // if (response.statusCode == 200) {
    //   final userModel = userFromJson(response.body);
    //   return userModel;
    // }
  }

  @override
  void initState() {
    super.initState();
    getprofileData();
  }

  int selectedPosition = 0;
  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('User Profile'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: getprofileData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User user = snapshot.data;
                return Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(250),
                          child: Image.network(
                            'https://wanderguide.net/assets/site/images/events/1.jpg',
                            height: 150,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFieldWidget(
                        label: 'Username',
                        text: user.fname + '\t\t' + user.lname,
                        onChanged: (name) {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFieldWidget(
                        label: 'Email',
                        text: user.email,
                        onChanged: (email) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFieldWidget(
                        label: 'Phone number',
                        text: user.phone,
                        onChanged: (phone) {},
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .4,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .03,
                        ),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('Save',
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
                          // onPressed: () {
                          //   if (_formKey.currentState.validate()) {
                          //     _uploadFile(_file, context);
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 HomePage()));
                          //   }
                          // },
                        )),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFFFE4B02),
          shape: CircularNotchedRectangle(),
          child: Container(
            width: double.maxFinite,
            height: 60,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TabItem(
                  text: tabs[0],
                  icon: Icons.home,
                  isSelected: selectedPosition == 0,
                  onTap: () {
                    setState(() {
                      selectedPosition = 0;
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  },
                ),
                TabItem(
                  text: tabs[1],
                  icon: Icons.favorite,
                  isSelected: selectedPosition == 1,
                  onTap: () {
                    setState(() {
                      selectedPosition = 1;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavouriteScreen()));
                    });
                  },
                ),
                TabItem(
                  text: tabs[2],
                  icon: Icons.event,
                  isSelected: selectedPosition == 2,
                  onTap: () {
                    setState(() {
                      selectedPosition = 2;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyEventPage()));
                    });
                  },
                ),
                TabItem(
                  text: tabs[3],
                  icon: Icons.search,
                  isSelected: selectedPosition == 3,
                  onTap: () {
                    setState(() {
                      selectedPosition = 3;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    });
                  },
                ),
                TabItem(
                  text: tabs[4],
                  icon: Icons.person,
                  isSelected: selectedPosition == 4,
                  onTap: () {
                    setState(() {
                      selectedPosition = 4;
                      scaffoldKey.currentState.openDrawer();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        drawer: MyDrawer());
  }
}
