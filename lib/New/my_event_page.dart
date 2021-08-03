import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:we_gather_application/Models/all_events_model.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/comment_screen.dart';
import 'package:we_gather_application/Screens/event_details.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/my_events_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
import 'package:http/http.dart' as http;

class MyEventPage extends StatefulWidget {
  @override
  _MyEventPageState createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  Future<List<AllEventsModel>> allEvents;
  Future getAllevents() async {
    var Api = Uri.parse("https://wanderguide.net/api/events");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final eventModel = allEventsFromJson(response.body);
      print(response.body);
      return eventModel;
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAllevents();
    });
  }

  int selectedPosition = 0;
  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFE4B02),
        toolbarHeight: 70,
        title: Text(
          ' All Events',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //     margin: EdgeInsets.only(top: 20, left: 30),
            //     child: Row(
            //       children: [
            //         Text(
            //           'Most Sharing',
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     )),
            // Container(
            //   margin: EdgeInsets.only(left: 10, top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           ClipRRect(
            //             borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(15),
            //                 topRight: Radius.circular(15)),
            //             child: Image.asset('assets/unsplash4.jpg',
            //                 height: 150, width: 130, fit: BoxFit.cover),
            //           ),
            //           Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text(
            //                   'Event Name',
            //                   style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 18),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 30),
            //             child: GestureDetector(
            //                 onTap: () {
            //                   return showDialog(
            //                       context: context,
            //                       builder: (context) {
            //                         return AlertDialog(
            //                           title: Text(
            //                             'Event Dates',
            //                             style: TextStyle(
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                           content: Container(
            //                             height: 150,
            //                             child: Column(
            //                               children: [
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       'Start Date',
            //                                       style: TextStyle(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     Text(
            //                                       'End Date',
            //                                       style: TextStyle(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         );
            //                       });
            //                 },
            //                 child: Icon(Icons.calendar_today)),
            //           ),
            //           SizedBox(
            //             height: 20,
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
            //                 style: TextStyle(fontSize: 16),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //       SizedBox(
            //         width: 8,
            //       ),
            //       Column(
            //         children: [
            //           ClipRRect(
            //             borderRadius:
            //                 BorderRadius.only(topLeft: Radius.circular(15)),
            //             child: Image.asset(
            //               'assets/unsplash4.jpg',
            //               height: 150,
            //               fit: BoxFit.cover,
            //               width: 130,
            //             ),
            //           ),
            //           Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text(
            //                   'Event Name',
            //                   style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 18),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 30),
            //             child: GestureDetector(
            //                 onTap: () {
            //                   return showDialog(
            //                       context: context,
            //                       builder: (context) {
            //                         return AlertDialog(
            //                           title: Text(
            //                             'Event Dates',
            //                             style: TextStyle(
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                           content: Container(
            //                             height: 150,
            //                             child: Column(
            //                               children: [
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       'Start Date',
            //                                       style: TextStyle(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     Text(
            //                                       'End Date',
            //                                       style: TextStyle(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 ),
            //                                 Row(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment
            //                                           .spaceBetween,
            //                                   children: [
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     ),
            //                                     Text(
            //                                       '12/3/202',
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.normal),
            //                                     )
            //                                   ],
            //                                 )
            //                               ],
            //                             ),
            //                           ),
            //                         );
            //                       });
            //                 },
            //                 child: Icon(Icons.calendar_today)),
            //           ),
            //           SizedBox(
            //             height: 20,
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
            //                 style: TextStyle(fontSize: 16),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
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
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      'All Events ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: getAllevents(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  AllEventsModel model = snapshot.data;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: model.data.events.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.network(
                                        'https://wanderguide.net/assets/site/images/events/${model.data.events[index].details.cover}',
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${model.data.events[index].details.titleEn}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                title: Text('Event Dates'),
                                                content: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Start Date',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF272C48),
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text('End Date',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF272C48),
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        SizedBox(
                                                          height: 100,
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .vertical,
                                                                  shrinkWrap:
                                                                      true, //MUST TO ADDED
                                                                  itemCount: model
                                                                      .data
                                                                      .events[
                                                                          index]
                                                                      .dates
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          num) {
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                '${model.data.events[index].dates[num].startDate}',
                                                                                style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 50,
                                                                              ),
                                                                              Flexible(
                                                                                flex: 2,
                                                                                fit: FlexFit.loose,
                                                                                child: Text(
                                                                                  '${model.data.events[index].dates[num].endDate}',
                                                                                  style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }),
                                                        )
                                                      ],
                                                    )));
                                          });
                                    },
                                    child: Icon(Icons.calendar_today)),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${model.data.events[index].details.lat.toString()}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
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
                isSelected: false,
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
