import 'package:flutter/material.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';

class OrganizationScreen extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedPosition = 0;

  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('My organizer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/hero.jpg',
                      height: 100, width: 100, fit: BoxFit.cover),
                ),
                title: Text(
                  'MR Smith Danel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('M@M.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text('Number of events: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          Icon(
                            Icons.favorite,
                            color: Color(0xFFFE6B02),
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/hero.jpg',
                      height: 100, width: 100, fit: BoxFit.cover),
                ),
                title: Text(
                  'MR Smith Danel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('M@M.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text('Number of events: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          Icon(
                            Icons.favorite,
                            color: Color(0xFFFE6B02),
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/hero.jpg',
                      height: 100, width: 100, fit: BoxFit.cover),
                ),
                title: Text(
                  'MR Smith Danel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('M@M.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text('Number of events: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          Icon(
                            Icons.favorite,
                            color: Color(0xFFFE6B02),
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/hero.jpg',
                      height: 100, width: 100, fit: BoxFit.cover),
                ),
                title: Text(
                  'MR Smith Danel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('M@M.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text('Number of events: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          Icon(
                            Icons.favorite,
                            color: Color(0xFFFE6B02),
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                isSelected: false,

                //isSelected: true,
                onTap: () {
                  setState(() {
                    selectedPosition = 0;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
