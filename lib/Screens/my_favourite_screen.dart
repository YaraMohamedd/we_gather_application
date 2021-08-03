import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:http/http.dart' as http;
import 'package:we_gather_application/Screens/my_events_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';

class MyFavouriteScreen extends StatefulWidget {
  @override
  _MyFavouriteScreenState createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  int selectedPosition = 0;
  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<MostSharing>> sharing;

  static Future<List<MostSharing>> getAllAuthors() async {
    var Api = Uri.parse("https://wanderguide.net/api/TrendingEvents");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<MostSharing>((item) => MostSharing.fromJson(item))
          .toList();
    } else {
      //print('Error');
      throw Exception("Can't load user");
    }
  }

  @override
  Widget build(BuildContext context) {
    var context2 = context;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFFE4B02),
          toolbarHeight: 70,
          title: Text(
            ' My Favourites',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        drawer: MyDrawer(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset('assets/unsplash4.jpg',
                              height: 150, width: 130, fit: BoxFit.cover),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Event Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: GestureDetector(
                              onTap: () {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Event Dates',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Start Date',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'End Date',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Icon(Icons.calendar_today)),
                        ),
                        SizedBox(
                          height: 20,
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
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: GestureDetector(
                              onTap: () {
                                return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Event Dates',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Start Date',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'End Date',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    '12/3/202',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Icon(Icons.calendar_today)),
                        ),
                        SizedBox(
                          height: 20,
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
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.access_time_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 'start date |',
              //                 style: TextStyle(
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 4,
              //               ),
              //               Text(
              //                 '2021-02-01 23:10:50',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 6,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.access_time_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 'End date |',
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 12,
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 4,
              //               ),
              //               Text(
              //                 '2021-02-01 23:10:50',
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 12),
              //               ),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 6,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.location_on_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 'Giza , Cairo , Egypt',
              //                 style: TextStyle(fontSize: 12),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.access_time_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 'start date |',
              //                 style: TextStyle(fontSize: 12),
              //               ),
              //               SizedBox(
              //                 width: 4,
              //               ),
              //               Text(
              //                 '2021-02-01 23:10:50',
              //                 style: TextStyle(
              //                     color: Color(0xFFFE6B02),
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 12),
              //               ),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 6,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.access_time_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text('End date |'),
              //               SizedBox(
              //                 width: 4,
              //               ),
              //               Text(
              //                 '2021-02-01 23:10:50',
              //                 style: TextStyle(
              //                     color: Color(0xFFFE6B02),
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 12),
              //               ),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 6,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.location_on_outlined,
              //                 size: 15,
              //                 color: Colors.grey,
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Text(
              //                 'Giza , Cairo , Egypt',
              //                 style: TextStyle(fontSize: 12),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: GestureDetector(
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Event Dates',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'End Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.calendar_today)),
                    ),
                    SizedBox(
                      height: 20,
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
                          style: TextStyle(fontSize: 16),
                        ),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: GestureDetector(
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Event Dates',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'End Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.calendar_today)),
                    ),
                    SizedBox(
                      height: 20,
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
                          style: TextStyle(fontSize: 16),
                        ),
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
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Event Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: GestureDetector(
                          onTap: () {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Event Dates',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'End Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                '12/3/202',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.calendar_today)),
                    ),
                    SizedBox(
                      height: 20,
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
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
        ));
  }
}
