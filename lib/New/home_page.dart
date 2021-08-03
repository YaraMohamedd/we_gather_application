import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:http/http.dart' as http;
import 'package:we_gather_application/Models/newest_event_model.dart';
import 'package:we_gather_application/Models/statistics_model.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/search_page.dart';
import 'package:we_gather_application/New/sign_in.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
import 'package:get/get.dart';
import 'package:we_gather_application/config/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedPosition = 0;

  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  Future<List<MostSharing>> sharing;

  static Future<List<MostSharing>> getAllMostsharing() async {
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

  Future getStatistics() async {
    var Api = Uri.parse("https://wanderguide.net/api/Statistics");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final statistics = statisticsFromJson(response.body);
      return statistics;
    } else {
      throw Exception('Error');
    }
  }

  static Future<List<NewestEvent>> getAllnewest() async {
    var Api = Uri.parse("https://wanderguide.net/api/TrendingEvents");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<NewestEvent>((item) => NewestEvent.fromJson(item))
          .toList();
    } else {
      //print('Error');
      throw Exception("Can't load user");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sharing = getAllMostsharing();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Column(
                //   children: [
                //     // Image.asset(
                //     //   'assets/unsplash2.jpg',
                //     //   height: MediaQuery.of(context).size.height * .4,
                //     //   width: double.infinity,
                //     //   fit: BoxFit.cover,
                //     // ),
                //     // SizedBox(
                //     //   height: MediaQuery.of(context).size.height * .02,
                //     // ),
                //     Text(
                //       'الانشطه و الفعاليات',
                //       style: TextStyle(
                //           color: Color(0xFF272C48),
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     FutureBuilder<List<MostSharing>>(
                //       future: sharing,
                //       builder: (context, snapshot) {
                //         if (snapshot.hasData) {
                //           return SizedBox(
                //               width: double.infinity,
                //                 height: MediaQuery.of(context).size.height,
                //               child: ListView.builder(
                //                   shrinkWrap: true,
                //                   scrollDirection: Axis.vertical,
                //                   itemCount: snapshot.data.length,
                //                   itemBuilder: (context, index) {
                //                     return Container(
                //                       margin: EdgeInsets.only(left: 30),
                //                       child: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.end,
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.end,
                //                         children: [
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment
                //                                     .spaceBetween,
                //                             children: [
                //                               Container(
                //                                 margin: EdgeInsets.only(
                //                                     left: MediaQuery.of(
                //                                                 context)
                //                                             .size
                //                                             .width *
                //                                         .01),
                //                                 child: Column(
                //                                   children: [
                //                                     Text(
                //                                       '${snapshot.data[index].details.titleAr.toString()}',
                //                                       style: TextStyle(
                //                                           color: Color(
                //                                               0xFF272C48),
                //                                           fontSize: 18,
                //                                           fontWeight:
                //                                               FontWeight
                //                                                   .bold),
                //                                     ),
                //                                     SizedBox(
                //                                       height: 10,
                //                                     ),
                //                                     GestureDetector(
                //                                         onTap: () {
                //                                           return showDialog(
                //                                               context:
                //                                                   context,
                //                                               builder:
                //                                                   (context) {
                //                                                 return AlertDialog(
                //                                                     title: Text(
                //                                                         'Event Dates'),
                //                                                     content: Container(
                //                                                         width: MediaQuery.of(context).size.width,
                //                                                         height: 200,
                //                                                         child: Column(
                //                                                           mainAxisSize: MainAxisSize.min,
                //                                                           children: [
                //                                                             Row(
                //                                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                                                               children: [
                //                                                                 Text('Start Date', style: TextStyle(color: Color(0xFF272C48), fontSize: 17, fontWeight: FontWeight.bold)),
                //                                                                 Text('End Date', style: TextStyle(color: Color(0xFF272C48), fontSize: 17, fontWeight: FontWeight.bold)),
                //                                                               ],
                //                                                             ),
                //                                                             SizedBox(
                //                                                               height: 20,
                //                                                             ),
                //                                                             SizedBox(
                //                                                               height: 100,
                //                                                               width: double.infinity,
                //                                                               child: ListView.builder(
                //                                                                   scrollDirection: Axis.vertical,
                //                                                                   shrinkWrap: true, //MUST TO ADDED
                //                                                                   itemCount: snapshot.data[index].dates.length,
                //                                                                   itemBuilder: (context, num) {
                //                                                                     return Container(
                //                                                                       width: double.infinity,
                //                                                                       child: Column(
                //                                                                         children: [
                //                                                                           Row(
                //                                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                                                                             children: [
                //                                                                               Text(
                //                                                                                 '${snapshot.data[index].dates[num].startDate}',
                //                                                                                 style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                //                                                                               ),
                //                                                                               SizedBox(
                //                                                                                 width: 50,
                //                                                                               ),
                //                                                                               Flexible(
                //                                                                                 flex: 2,
                //                                                                                 fit: FlexFit.loose,
                //                                                                                 child: Text(
                //                                                                                   '${snapshot.data[index].dates[num].endDate}',
                //                                                                                   style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                //                                                                                 ),
                //                                                                               ),
                //                                                                             ],
                //                                                                           )
                //                                                                         ],
                //                                                                       ),
                //                                                                     );
                //                                                                   }),
                //                                                             )
                //                                                           ],
                //                                                         )));
                //                                               });
                //                                         },
                //                                         child: Icon(Icons
                //                                             .calendar_today)),
                //                                     SizedBox(
                //                                       height: 20,
                //                                     ),
                //                                     Row(
                //                                       mainAxisAlignment:
                //                                           MainAxisAlignment
                //                                               .start,
                //                                       children: [
                //                                         Text(
                //                                           '${snapshot.data[index].details.price}' +
                //                                               '\t' +
                //                                               'SR',
                //                                           style: TextStyle(
                //                                               color: Color(
                //                                                   0xFF272C48),
                //                                               fontSize: 15,
                //                                               fontWeight:
                //                                                   FontWeight
                //                                                       .bold),
                //                                         ),
                //                                         SizedBox(
                //                                           width: 10,
                //                                         ),
                //                                         Row(
                //                                           mainAxisAlignment:
                //                                               MainAxisAlignment
                //                                                   .spaceAround,
                //                                           children: [
                //                                             Icon(Icons
                //                                                 .star_border_outlined),
                //                                             Icon(
                //                                               Icons.star,
                //                                               color: Colors
                //                                                   .yellow,
                //                                             ),
                //                                             Icon(
                //                                               Icons.star,
                //                                               color: Colors
                //                                                   .yellow,
                //                                             ),
                //                                             Icon(
                //                                               Icons.star,
                //                                               color: Colors
                //                                                   .yellow,
                //                                             ),
                //                                             Icon(
                //                                               Icons.star,
                //                                               color: Colors
                //                                                   .yellow,
                //                                             )
                //                                           ],
                //                                         )
                //                                       ],
                //                                     )
                //                                   ],
                //                                 ),
                //                               ),
                //                               Container(
                //                                 margin: EdgeInsets.only(
                //                                     right: MediaQuery.of(
                //                                                 context)
                //                                             .size
                //                                             .width *
                //                                         .05),
                //                                 child: Flexible(
                //                                   flex: 8,
                //                                   child: ClipRRect(
                //                                     borderRadius:
                //                                         BorderRadius
                //                                             .circular(20),
                //                                     child: Image.network(
                //                                       'https://images.unsplash.com/photo-1559586616-361e18714958?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
                //                                       height: 200,
                //                                       width: 150,
                //                                       fit: BoxFit.cover,
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 top: 9,
                //                                 right: 14,
                //                                 left: 14),
                //                             child: Divider(
                //                               color: Colors.grey,
                //                               thickness: 1,
                //                             ),
                //                           ),
                //                           // SizedBox(
                //                           //     height:
                //                           //         MediaQuery.of(context).size.height *
                //                           //             .04),
                //                         ],
                //                       ),
                //                     );
                //                     // return ListTile(
                //                     //   trailing: ClipRRect(
                //                     //     borderRadius: BorderRadius.circular(20),
                //                     //     child: Image.network(
                //                     //       'https://wanderguide.net/assets/site/images/events/1.jpg',
                //                     //       height: 400,
                //                     //       width: 300,
                //                     //       fit: BoxFit.cover,
                //                     //     ),
                //                     //   ),
                //                     //   title: Column(
                //                     //     crossAxisAlignment:
                //                     //         CrossAxisAlignment.end,
                //                     //     children: [
                //                     //       Text(
                //                     //         '${snapshot.data[index].details.titleAr.toString()}',
                //                     //         style: TextStyle(
                //                     //             color: Color(0xFF272C48),
                //                     //             fontSize: 18,
                //                     //             fontWeight: FontWeight.bold),
                //                     //       ),
                //                     //       Text(
                //                     //         '${snapshot.data[index].details.descriptionAr.toString()}',
                //                     //         style: TextStyle(
                //                     //             color: Color(0xFF272C48),
                //                     //             fontSize: 18,
                //                     //             fontWeight: FontWeight.bold),
                //                     //       ),
                //                     //       SizedBox(
                //                     //         height: 20,
                //                     //       ),
                //                     //       Container(
                //                     //         child: SizedBox(
                //                     //           width: 500,
                //                     //           height: 50,
                //                     //           child: ListView.builder(
                //                     //             shrinkWrap: true,
                //                     //             scrollDirection: Axis.horizontal,
                //                     //             itemCount: snapshot
                //                     //                 .data[index].dates.length,
                //                     //             itemBuilder: (context, num) {
                //                     //               return Column(
                //                     //                 children: [
                //                     //                   Text(
                //                     //                     '${snapshot.data[index].dates[num].startDate}',
                //                     //                     style: TextStyle(
                //                     //                         color:
                //                     //                             Color(0xFF272C48),
                //                     //                         fontSize: 18,
                //                     //                         fontWeight:
                //                     //                             FontWeight.bold),
                //                     //                   ),
                //                     //                   Text(
                //                     //                     '${snapshot.data[index].dates[num].endDate}',
                //                     //                     style: TextStyle(
                //                     //                         color:
                //                     //                             Color(0xFF272C48),
                //                     //                         fontSize: 18,
                //                     //                         fontWeight:
                //                     //                             FontWeight.bold),
                //                     //                   ),
                //                     //                 ],
                //                     //               );
                //                     //             },
                //                     //           ),
                //                     //         ),
                //                     //         margin: EdgeInsets.only(left: 30),
                //                     //       ),
                //                     //       SizedBox(
                //                     //         height: 20,
                //                     //         width: 20,
                //                     //       ),
                //                     //       Row(
                //                     //         mainAxisAlignment:
                //                     //             MainAxisAlignment.spaceAround,
                //                     //         children: [
                //                     //           Text(
                //                     //               '${snapshot.data[index].details.price + '\t\t' + 'SR'}',
                //                     //               style: TextStyle(
                //                     //                   color: Color(0xFF272C48),
                //                     //                   fontSize: 20,
                //                     //                   fontWeight:
                //                     //                       FontWeight.bold)),
                //                     //           Row(
                //                     //             children: [
                //                     //               Text('204',
                //                     //                   style: TextStyle(
                //                     //                       color: Colors.amber,
                //                     //                       fontSize: 20,
                //                     //                       fontWeight:
                //                     //                           FontWeight.bold)),
                //                     //               SizedBox(
                //                     //                 width: 10,
                //                     //               ),
                //                     //               Icon(
                //                     //                   Icons.star_border_outlined),
                //                     //               Icon(
                //                     //                 Icons.star,
                //                     //                 color: Colors.amber,
                //                     //               ),
                //                     //               Icon(
                //                     //                 Icons.star,
                //                     //                 color: Colors.amber,
                //                     //               ),
                //                     //               Icon(
                //                     //                 Icons.star,
                //                     //                 color: Colors.amber,
                //                     //               ),
                //                     //               Icon(
                //                     //                 Icons.star,
                //                     //                 color: Colors.amber,
                //                     //               ),
                //                     //             ],
                //                     //           ),
                //                     //         ],
                //                     //       ),
                //                     //       Divider(
                //                     //         thickness: 2,
                //                     //       )
                //                     //     ],
                //                     //   ),
                //                     // );
                //                     // return Card(
                //                     //     child: Column(
                //                     //       children: [
                //                     //         Text('${snapshot.data[index].details.descriptionAr}'),
                //                     //         Text('${snapshot.data[index].details.addressId}'),
                //                     //
                //                     //       ],
                //                     //     ));
                //                   }));
                //         } else {
                //           // return Center(child: CircularProgressIndicator());
                //           return Text('kjkk');
                //         }
                //       },
                //     ),
                //   ],
                // ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 1 * SizeConfig.heightMultiplier),
                    child: Image.asset(
                      'assets/unsplash2.jpg',
                      // height: MediaQuery.of(context).size.height * .4,
                      // width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .01),
                        child: Image.asset(
                          'assets/wegather.png',
                          height: 120,
                          width: 400,
                        )),
                    Text(
                      'من هنا تجد اكثر الاماكن متعه',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    RaisedButton(
                        color: Color(0xFF272C48),
                        child: Text('اختر وجهتك',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {}),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .03),
                      child: Text(
                        'WANDER GUIDE',
                        style: TextStyle(
                            letterSpacing: 10.0, color: Color(0xFFFE6B02)),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  child: Text(
                    'الانشطه و الفعاليات',
                    style: TextStyle(
                        color: Color(0xFF272C48),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder<List<MostSharing>>(
                  future: sharing,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .01),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${snapshot.data[index].details.titleAr.toString()}',
                                                  style: TextStyle(
                                                      color: Color(0xFF272C48),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      return showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                                title: Text(
                                                                    'Event Dates'),
                                                                content:
                                                                    Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            200,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text('Start Date', style: TextStyle(color: Color(0xFF272C48), fontSize: 17, fontWeight: FontWeight.bold)),
                                                                                Text('End Date', style: TextStyle(color: Color(0xFF272C48), fontSize: 17, fontWeight: FontWeight.bold)),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            SizedBox(
                                                                              height: 100,
                                                                              width: double.infinity,
                                                                              child: ListView.builder(
                                                                                  scrollDirection: Axis.vertical,
                                                                                  shrinkWrap: true, //MUST TO ADDED
                                                                                  itemCount: snapshot.data[index].dates.length,
                                                                                  itemBuilder: (context, num) {
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${snapshot.data[index].dates[num].startDate}',
                                                                                                style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                                                                                              ),
                                                                                              SizedBox(
                                                                                                width: 50,
                                                                                              ),
                                                                                              Flexible(
                                                                                                flex: 2,
                                                                                                fit: FlexFit.loose,
                                                                                                child: Text(
                                                                                                  '${snapshot.data[index].dates[num].endDate}',
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
                                                    child: Icon(
                                                        Icons.calendar_today)),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${snapshot.data[index].details.price}' +
                                                          '\t' +
                                                          'SR',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF272C48),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(Icons
                                                            .star_border_outlined),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignInPage()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .05),
                                              child: Flexible(
                                                flex: 8,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    'https://wanderguide.net/assets/site/images/events/${snapshot.data[index].details.cover}',
                                                    height: 200,
                                                    width: 150,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 9, right: 14, left: 14),
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                      ),
                                      // SizedBox(
                                      //     height:
                                      //         MediaQuery.of(context).size.height *
                                      //             .04),
                                    ],
                                  ),
                                );
                                // return ListTile(
                                //   trailing: ClipRRect(
                                //     borderRadius: BorderRadius.circular(20),
                                //     child: Image.network(
                                //       'https://wanderguide.net/assets/site/images/events/1.jpg',
                                //       height: 400,
                                //       width: 300,
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
                                //   title: Column(
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.end,
                                //     children: [
                                //       Text(
                                //         '${snapshot.data[index].details.titleAr.toString()}',
                                //         style: TextStyle(
                                //             color: Color(0xFF272C48),
                                //             fontSize: 18,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       Text(
                                //         '${snapshot.data[index].details.descriptionAr.toString()}',
                                //         style: TextStyle(
                                //             color: Color(0xFF272C48),
                                //             fontSize: 18,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //       ),
                                //       Container(
                                //         child: SizedBox(
                                //           width: 500,
                                //           height: 50,
                                //           child: ListView.builder(
                                //             shrinkWrap: true,
                                //             scrollDirection: Axis.horizontal,
                                //             itemCount: snapshot
                                //                 .data[index].dates.length,
                                //             itemBuilder: (context, num) {
                                //               return Column(
                                //                 children: [
                                //                   Text(
                                //                     '${snapshot.data[index].dates[num].startDate}',
                                //                     style: TextStyle(
                                //                         color:
                                //                             Color(0xFF272C48),
                                //                         fontSize: 18,
                                //                         fontWeight:
                                //                             FontWeight.bold),
                                //                   ),
                                //                   Text(
                                //                     '${snapshot.data[index].dates[num].endDate}',
                                //                     style: TextStyle(
                                //                         color:
                                //                             Color(0xFF272C48),
                                //                         fontSize: 18,
                                //                         fontWeight:
                                //                             FontWeight.bold),
                                //                   ),
                                //                 ],
                                //               );
                                //             },
                                //           ),
                                //         ),
                                //         margin: EdgeInsets.only(left: 30),
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //         width: 20,
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceAround,
                                //         children: [
                                //           Text(
                                //               '${snapshot.data[index].details.price + '\t\t' + 'SR'}',
                                //               style: TextStyle(
                                //                   color: Color(0xFF272C48),
                                //                   fontSize: 20,
                                //                   fontWeight:
                                //                       FontWeight.bold)),
                                //           Row(
                                //             children: [
                                //               Text('204',
                                //                   style: TextStyle(
                                //                       color: Colors.amber,
                                //                       fontSize: 20,
                                //                       fontWeight:
                                //                           FontWeight.bold)),
                                //               SizedBox(
                                //                 width: 10,
                                //               ),
                                //               Icon(
                                //                   Icons.star_border_outlined),
                                //               Icon(
                                //                 Icons.star,
                                //                 color: Colors.amber,
                                //               ),
                                //               Icon(
                                //                 Icons.star,
                                //                 color: Colors.amber,
                                //               ),
                                //               Icon(
                                //                 Icons.star,
                                //                 color: Colors.amber,
                                //               ),
                                //               Icon(
                                //                 Icons.star,
                                //                 color: Colors.amber,
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //       Divider(
                                //         thickness: 2,
                                //       )
                                //     ],
                                //   ),
                                // );
                                // return Card(
                                //     child: Column(
                                //       children: [
                                //         Text('${snapshot.data[index].details.descriptionAr}'),
                                //         Text('${snapshot.data[index].details.addressId}'),
                                //
                                //       ],
                                //     ));
                              }));
                    } else {
                      // return Center(child: CircularProgressIndicator());
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Color(0xFFFE4B02),
                        color: Colors.white,
                      ));
                    }
                  },
                ),
              ],
            ),
            Text(
              'Newest Events'.tr,
              style: TextStyle(
                  color: Color(0xFF272C48),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<NewestEvent>>(
              future: getAllnewest(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .01),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${snapshot.data[index].details.titleAr.toString()}',
                                              style: TextStyle(
                                                  color: Color(0xFF272C48),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  return showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                            title: Text(
                                                                'Event Dates'),
                                                            content: Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 200,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            'Start Date',
                                                                            style: TextStyle(
                                                                                color: Color(0xFF272C48),
                                                                                fontSize: 17,
                                                                                fontWeight: FontWeight.bold)),
                                                                        Text(
                                                                            'End Date',
                                                                            style: TextStyle(
                                                                                color: Color(0xFF272C48),
                                                                                fontSize: 17,
                                                                                fontWeight: FontWeight.bold)),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          100,
                                                                      width: double
                                                                          .infinity,
                                                                      child: ListView.builder(
                                                                          scrollDirection: Axis.vertical,
                                                                          shrinkWrap: true, //MUST TO ADDED
                                                                          itemCount: snapshot.data[index].dates.length,
                                                                          itemBuilder: (context, num) {
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${snapshot.data[index].dates[num].startDate}',
                                                                                        style: TextStyle(color: Color(0xFF272C48), fontSize: 12, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 50,
                                                                                      ),
                                                                                      Flexible(
                                                                                        flex: 2,
                                                                                        fit: FlexFit.loose,
                                                                                        child: Text(
                                                                                          '${snapshot.data[index].dates[num].endDate}',
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
                                                child:
                                                    Icon(Icons.calendar_today)),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${snapshot.data[index].details.price}' +
                                                      '\t' +
                                                      'SR',
                                                  style: TextStyle(
                                                      color: Color(0xFF272C48),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(Icons
                                                        .star_border_outlined),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInPage()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05),
                                          child: Flexible(
                                            flex: 8,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                'https://wanderguide.net/assets/site/images/events/${snapshot.data[index].details.cover}',
                                                height: 200,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 9, right: 14, left: 14),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  // SizedBox(
                                  //     height:
                                  //         MediaQuery.of(context).size.height *
                                  //             .04),
                                ],
                              ),
                            );
                            // return ListTile(
                            //   trailing: ClipRRect(
                            //     borderRadius: BorderRadius.circular(20),
                            //     child: Image.network(
                            //       'https://wanderguide.net/assets/site/images/events/1.jpg',
                            //       height: 400,
                            //       width: 300,
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            //   title: Column(
                            //     crossAxisAlignment:
                            //         CrossAxisAlignment.end,
                            //     children: [
                            //       Text(
                            //         '${snapshot.data[index].details.titleAr.toString()}',
                            //         style: TextStyle(
                            //             color: Color(0xFF272C48),
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Text(
                            //         '${snapshot.data[index].details.descriptionAr.toString()}',
                            //         style: TextStyle(
                            //             color: Color(0xFF272C48),
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       SizedBox(
                            //         height: 20,
                            //       ),
                            //       Container(
                            //         child: SizedBox(
                            //           width: 500,
                            //           height: 50,
                            //           child: ListView.builder(
                            //             shrinkWrap: true,
                            //             scrollDirection: Axis.horizontal,
                            //             itemCount: snapshot
                            //                 .data[index].dates.length,
                            //             itemBuilder: (context, num) {
                            //               return Column(
                            //                 children: [
                            //                   Text(
                            //                     '${snapshot.data[index].dates[num].startDate}',
                            //                     style: TextStyle(
                            //                         color:
                            //                             Color(0xFF272C48),
                            //                         fontSize: 18,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   ),
                            //                   Text(
                            //                     '${snapshot.data[index].dates[num].endDate}',
                            //                     style: TextStyle(
                            //                         color:
                            //                             Color(0xFF272C48),
                            //                         fontSize: 18,
                            //                         fontWeight:
                            //                             FontWeight.bold),
                            //                   ),
                            //                 ],
                            //               );
                            //             },
                            //           ),
                            //         ),
                            //         margin: EdgeInsets.only(left: 30),
                            //       ),
                            //       SizedBox(
                            //         height: 20,
                            //         width: 20,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Text(
                            //               '${snapshot.data[index].details.price + '\t\t' + 'SR'}',
                            //               style: TextStyle(
                            //                   color: Color(0xFF272C48),
                            //                   fontSize: 20,
                            //                   fontWeight:
                            //                       FontWeight.bold)),
                            //           Row(
                            //             children: [
                            //               Text('204',
                            //                   style: TextStyle(
                            //                       color: Colors.amber,
                            //                       fontSize: 20,
                            //                       fontWeight:
                            //                           FontWeight.bold)),
                            //               SizedBox(
                            //                 width: 10,
                            //               ),
                            //               Icon(
                            //                   Icons.star_border_outlined),
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.amber,
                            //               ),
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.amber,
                            //               ),
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.amber,
                            //               ),
                            //               Icon(
                            //                 Icons.star,
                            //                 color: Colors.amber,
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //       Divider(
                            //         thickness: 2,
                            //       )
                            //     ],
                            //   ),
                            // );
                            // return Card(
                            //     child: Column(
                            //       children: [
                            //         Text('${snapshot.data[index].details.descriptionAr}'),
                            //         Text('${snapshot.data[index].details.addressId}'),
                            //
                            //       ],
                            //     ));
                          }));
                } else {
                  // return Center(child: CircularProgressIndicator());
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Color(0xFFFE4B02),
                    color: Colors.white,
                  ));
                }
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEventPage()));
              },
              child: Text(
                'View All Events'.tr,
                style: TextStyle(
                    color: Color(0xFF272C48),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                isSelected: true,
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0, // this will be set when a new tab is tapped
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.search,
      //         color: Color(0xFFFE6B02),
      //         size: 30,
      //       ),
      //       title: new Text(
      //         'اكتشف',
      //         style: TextStyle(
      //             color: Color(0xFFFE6B02),
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.favorite_outlined,
      //         color: Color(0xFF272C48),
      //         size: 30,
      //       ),
      //       title: new Text(
      //         'مفضله',
      //         style: TextStyle(
      //             color: Color(0xFF272C48),
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18),
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_repair_service_rounded,
      //           color: Color(0xFF272C48),
      //           size: 30,
      //         ),
      //         title: Text(
      //           'حجوزاتي',
      //           style: TextStyle(
      //               color: Color(0xFF272C48),
      //               fontWeight: FontWeight.bold,
      //               fontSize: 18),
      //         )),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_repair_service_rounded,
      //           color: Color(0xFF272C48),
      //           size: 30,
      //         ),
      //         title: Text(
      //           'ديد',
      //           style: TextStyle(
      //               color: Color(0xFF272C48),
      //               fontWeight: FontWeight.bold,
      //               fontSize: 18),
      //         ))
      //   ],
      // ),
    );
  }
}
