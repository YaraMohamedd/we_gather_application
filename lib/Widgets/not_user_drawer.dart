import 'package:flutter/material.dart';
import 'package:we_gather_application/Screens/about_screen.dart';
import 'package:we_gather_application/New/contact_us_screen.dart';
import 'package:we_gather_application/New/sign_up_screen.dart';

class NotUserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 300,
            child: DrawerHeader(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Color(0xFFFE6B02)),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/wegather.png',
                      height: 200,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Transform.translate(
                      offset: Offset(100, 170),
                      child: Text(
                        'WE GATHER',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      )),
                  Transform.translate(
                    offset: Offset(10, 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          color: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          color: Colors.white,
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('About WeGather'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              color: Color(0xFFFE6B02),
              child: Text(
                'SignUp',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'English',
                  style: TextStyle(color: Color(0xFFFE6B02)),
                ),
                Text('|', style: TextStyle(color: Color(0xFFFE6B02))),
                Text('Arabic', style: TextStyle(color: Color(0xFFFE6B02)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
