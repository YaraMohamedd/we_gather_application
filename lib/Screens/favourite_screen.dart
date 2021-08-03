import 'package:flutter/material.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/my_favourite_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int selectedPosition = 0;

  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Favourite List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                child: Image.asset(
                  'assets/cherry.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                )),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'You have no events on your list',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Add  events to list by tapping the heart icon',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: OutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyFavouriteScreen()));
                },
                child: Text(
                  "Find your favourite",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                borderSide: BorderSide(color: Color(0xFFFE6B02)),
                shape: StadiumBorder(),
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
                isSelected: selectedPosition == 0,
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
