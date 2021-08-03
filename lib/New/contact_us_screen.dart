import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Screens/user_profile_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  int selectedPosition = 0;
  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: Text(' Contact Us'),
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: [
                Center(
                    child: Image.asset(
                  'assets/wegather.png',
                  height: 300,
                )),
                Transform.translate(
                    offset: Offset(150, 200),
                    child: Text(
                      'WE GATHER',
                      style: TextStyle(
                          color: Color(0xFFFE6B02),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ExpansionTileCard(
                baseColor: Colors.white,
                expandedColor: Colors.white,
                expandedTextColor: Colors.black,
                key: cardA,
                title: Text(
                  "Send an E-mail",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "get in touch with our customer service",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email Address',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Subject',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(.3),
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            height: 150,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Message',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
                        RaisedButton(
                            child: Text(
                              'Send',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            color: Color(0xFFfe9c56),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.4,
              height: 1.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
              child: ExpansionTileCard(
                baseColor: Colors.white,
                expandedColor: Colors.white,
                expandedTextColor: Colors.black,
                key: cardB,
                title: Text(
                  "Call Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Talk to us over phone/",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'Phone: 0188377266788',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.4,
              height: 1.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
              child: ExpansionTileCard(
                baseColor: Colors.white,
                expandedColor: Colors.white,
                expandedTextColor: Colors.black,
                key: cardC,
                title: Text(
                  "Visit Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Come and visit us at live location",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20,
                          ),
                          Text('Al khobar, Saudi Arabia')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
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
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

const List<Color> orangeGradients = [
  Color(0xFFfeac72),
  Color(0xFFfe9c56),
];
