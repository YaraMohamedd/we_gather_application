import 'package:flutter/material.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';

class MyEventsScreen extends StatefulWidget {
  @override
  _MyEventsScreenState createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFE6B02),
        toolbarHeight: 70,
        title: Text(
          ' Events',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Row(
                  children: [
                    Text(
                      'Most Sharing',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.asset('assets/unsplash4.jpg',
                            height: 150, width: 230, fit: BoxFit.cover),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Event Name',
                              style: TextStyle(
                                  color: Color(0xFFFE6B02),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15)),
                        child: Image.asset(
                          'assets/unsplash4.jpg',
                          height: 150,
                          fit: BoxFit.cover,
                          width: 130,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Event Name',
                              style: TextStyle(
                                  color: Color(0xFFFE6B02),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'start date |',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '2021-02-01 23:10:50',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('End date |'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '2021-02-01 23:10:50',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Giza , Cairo , Egypt',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'start date |',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '2021-02-01 23:10:50',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('End date |'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '2021-02-01 23:10:50',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Giza , Cairo , Egypt',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Row(
                  children: [
                    Text(
                      'All Events ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('assets/unsplash4.jpg',
                              height: 150,
                              width: MediaQuery.of(context).size.width * .9,
                              fit: BoxFit.cover),
                        ),
                        Transform.translate(
                            offset: Offset(300, 10),
                            child: Icon(
                              Icons.favorite,
                              color: Color(0xFFFE6B02),
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Event Name',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'start date |',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('End date |'),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Giza , Cairo , Egypt',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.grey,
                            ),
                            Text('10')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('assets/unsplash4.jpg',
                              height: 150,
                              width: MediaQuery.of(context).size.width * .9,
                              fit: BoxFit.cover),
                        ),
                        Transform.translate(
                            offset: Offset(300, 10),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Event Name',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'start date |',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('End date |'),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Giza , Cairo , Egypt',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.grey,
                            ),
                            Text('10')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('assets/unsplash4.jpg',
                              height: 150,
                              width: MediaQuery.of(context).size.width * .9,
                              fit: BoxFit.cover),
                        ),
                        Transform.translate(
                            offset: Offset(300, 10),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Event Name',
                            style: TextStyle(
                                color: Color(0xFFFE6B02),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'start date |',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('End date |'),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '2021-02-01 23:10:50',
                        style: TextStyle(
                            color: Color(0xFFFE6B02),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Giza , Cairo , Egypt',
                        style: TextStyle(fontSize: 12),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.thumb_up_alt,
                              color: Colors.grey,
                            ),
                            Text('10')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 75.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Color(0xFFFE6B02),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavouriteScreen()));
                    },
                  ),
                  Text('Favourite', style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                  ),
                  Text('Search', style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.event, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllEventsScreen()));
                    },
                  ),
                  Text('Events', style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person_outline, color: Colors.white),
                    onPressed: () {},
                  ),
                  Text('Profile', style: TextStyle(color: Colors.white))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
