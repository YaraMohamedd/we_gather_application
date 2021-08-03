import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_gather_application/New/about_us_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/view_profile_data.dart';
import 'package:we_gather_application/Screens/about_screen.dart';
import 'package:we_gather_application/New/contact_us_screen.dart';
import 'package:we_gather_application/Screens/my_events_screen.dart';
import 'package:we_gather_application/Screens/my_favourite_screen.dart';
import 'package:we_gather_application/Screens/organization_screen.dart';
import 'package:http/http.dart' as http;
import 'package:we_gather_application/New/sign_in_screen.dart';
import 'package:we_gather_application/Screens/user_profile_screen.dart';

class MyDrawer extends StatefulWidget {
  final UserToken args;
  const MyDrawer({Key key, this.args}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI =
        Uri.https('www.wanderguide.net', '/api/auth/logout', {'token': token});
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    http.Response response = await http.get(newURI, headers: headers);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    } else {
      print('x');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/path6.png'),
                  backgroundColor: Color(0xFFFE4B02),
                  radius: 50,
                ),
                Text(
                  'Johne S Danel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFE4B02),
            ),
          ),
          ListTile(
            title: Text('My Events'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyEventPage()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('My Favourite'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('My Organization'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrganizationScreen()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('About WeGather'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('User Profile '),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewProfileData()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()));
            },
            title: Text('Contact Us '),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
              margin: EdgeInsets.only(left: 70, right: 70, top: 30),
              child: RaisedButton(
                  color: Color(0xFFFE4B02),
                  child: Text(
                    'LogOut',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  onPressed: () {
                    logoutUser();
                  })),
        ],
      ),
    );
  }
}

class UserToken {
  final String token;
  UserToken(this.token);
}
