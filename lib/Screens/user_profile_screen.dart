import 'package:flutter/material.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70, right: 20, left: 20),
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    elevation: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .5,
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  cursorColor: Color(0xFFFE6B02),
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  cursorColor: Color(0xFFFE6B02),
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                child: TextFormField(
                                  cursorColor: Color(0xFFFE6B02),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                child: TextFormField(
                                  cursorColor: Color(0xFFFE6B02),
                                  decoration: InputDecoration(
                                    labelText: 'Phone',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
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
                  offset: Offset(100, MediaQuery.of(context).size.height * .56),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width * .5,
                    padding: const EdgeInsets.all(0.0),
                    height: 40,
                    child: RaisedButton(
                      color: Color(0xFFFE4B02),
                      onPressed: () {
                        // Navigator.of(context).push(_createRoute());
                      },
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Update Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyEventPage()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
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
      drawer: MyDrawer(),
    );
  }
}
