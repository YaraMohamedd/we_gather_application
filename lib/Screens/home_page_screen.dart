import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_gather_application/Blocs/api_bloc.dart';
import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:we_gather_application/Screens/about_screen.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/New/contact_us_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/my_events_screen.dart';
import 'package:we_gather_application/Screens/my_favourite_screen.dart';
import 'package:we_gather_application/Screens/organization_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/New/sign_in_screen.dart';
import 'package:we_gather_application/Screens/user_profile_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  final UserData args;

  const HomePageScreen({Key key, this.args}) : super(key: key);
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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

  List<int> index = [];
  Future getMostSharing() async {
    final newURI = Uri.https('www.wanderguide.net', '/api/TrendingEvents');
    http.Response response = await http.get(newURI);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return MostSharing.fromJson(data[index]);
    } else {
      print('x');
    }
  }

  File _file;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  // MostSharing activityModel ;
  // Future getMostSharing()  async{
  //   final newURI = Uri.https('www.wanderguide.net','/api/TrendingEvents');
  //   http.Response response = await http.get(newURI);
  //   if(response.statusCode == 200 ){
  //     var data = jsonDecode(response.body);
  //     activityModel= MostSharing.fromJson(data);
  //     return activityModel;
  //
  //   }else{
  //     print('x');
  //   }
  // }
  double _height;
  double _width;
  String _setTime, _setDate;
  Color color;
  String _hour, _minute, _time;
  String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Color(0xFFFF3661), //color of the main banner
                accentColor: Color(
                    0xFFFF3661), //color of circle indicating the selected date
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme
                        .accent //color of the text in the button "OK/CANCEL"
                    ),
              ),
              child: child);
        });
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    setState(() {
      sharing = getAllAuthors();
    });
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    // bloc.getTopsharing();
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               child: Image.asset('assets/path6.png'),
      //               backgroundColor: Color(0xFFFE6B02) ,
      //               radius: 50,
      //             ),
      //             Text('Johne S Danel',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
      //           ],
      //         ),
      //         decoration: BoxDecoration(
      //             color: Color(0xFFFE6B02)
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('My Events'),
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>MyEventsScreen()));
      //         },
      //       ),
      //       Divider(
      //         color: Colors.black,
      //       ),
      //
      //       ListTile(
      //         title: Text('My Favourite'),
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteScreen()));
      //
      //         },
      //       ),
      //       Divider(
      //         color: Colors.black,
      //       ),
      //
      //       ListTile(
      //         title: Text('My Organization'),
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>OrganizationScreen()));
      //         },
      //       ),
      //       Divider(
      //         color: Colors.black,
      //
      //       ),
      //
      //       ListTile(
      //         title: Text('About WeGather'),
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
      //         },
      //       ),
      //       Divider(
      //         color: Colors.black,
      //
      //       ),
      //       ListTile(
      //         title: Text('User Profile '),
      //         onTap: (){
      //          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen()));
      //         },
      //       ),
      //       Divider(
      //         color: Colors.black,
      //
      //       ),
      //       ListTile(
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsScreen()));
      //         },
      //         title: Text('Contact Us '),
      //       ),
      //       Divider(
      //         color: Colors.black,
      //
      //       ),
      //       Container(
      //           margin: EdgeInsets.only(left: 70,right: 70),
      //           child: RaisedButton(
      //               color: Color(0xFFFE6B02),
      //               child: Text('LogOut',style: TextStyle(color: Colors.white,fontSize: 16),),
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20),
      //                   borderSide: BorderSide.none
      //               ),
      //               onPressed: (){
      //                 logoutUser(context);
      //               })),
      //       Container(
      //         margin: EdgeInsets.only(top: 60),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             Text('English',style: TextStyle(color: Color(0xFFFE6B02)),),
      //             Text('|',style: TextStyle(color: Color(0xFFFE6B02))),
      //             Text('Arabic',style: TextStyle(color: Color(0xFFFE6B02)))
      //
      //
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/unsplash.jpg',
                  height: MediaQuery.of(context).size.height * .3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Transform.translate(
                    offset: Offset(120, 90),
                    child: Text(
                      'WANDER GUIDE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    )),
                Transform.translate(
                  offset: Offset(0, 160),
                  child: Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    color: Color(0xFF272C48),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 70,
                          height: 30,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Address',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                'Owner',
                                style: TextStyle(fontSize: 10),
                              )),
                        ),
                        Container(
                            width: 70,
                            height: 30,
                            child: RaisedButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 10,
                                    ),
                                    Text(
                                      'Start',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ))),
                        Container(
                            width: 70,
                            height: 30,
                            child: RaisedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 10,
                                    ),
                                    Text(
                                      'End',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ))),
                        Container(
                            width: 80,
                            height: 30,
                            child: RaisedButton(
                                color: Colors.blue.shade800,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  ),
                )
              ],
            ),

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
            SizedBox(
              height: 20,
            ),
            // StreamBuilder(
            //   stream: bloc.topsharing,
            //     builder:(context,AsyncSnapshot<MostSharing> snapshot){
            //     if(snapshot.hasData){
            //       return SizedBox(
            //         height: MediaQuery.of(context).size.height*.6,
            //         child:ListView.builder(
            //             shrinkWrap: true,
            //             itemCount: 5,
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context,index){
            //               return Card(
            //                 child: Container(
            //                   height: MediaQuery.of(context).size.height*.5,
            //                   width: double.infinity,
            //                   child: SingleChildScrollView(
            //                     child: Column(
            //                       children: [
            //                     Text(snapshot.data.details.descriptionAr)
            //                       ],
            //                     ),
            //                   ),
            //
            //                 ),
            //               );
            //             }
            //         ) ,
            //       );
            //     }else{
            //       return Center(child: CircularProgressIndicator());
            //     }
            //
            //     }
            // ),

            //    Container(
            //      margin: EdgeInsets.only(left: 10,top: 20),
            //      child: Row(
            //        mainAxisAlignment: MainAxisAlignment.start,
            //        children: [
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //            children: [
            //              ClipRRect(
            //                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            //                  child: Image.asset('assets/unsplash4.jpg',height: 150,width: 230,fit: BoxFit.cover),),
            //              Row(
            //                children: [
            //                  Padding(
            //                    padding: const EdgeInsets.all(8.0),
            //                    child: Text('Event Name',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 18),),
            //                  ),
            //                ],
            //              ),
            //
            //            ],
            //          ),
            //          SizedBox(width: 8,),
            //
            //          Column(
            //            children: [
            //              ClipRRect(
            //                borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
            //                child: Image.asset('assets/unsplash4.jpg',height: 150,fit: BoxFit.cover,width: 130,),),
            //              Row(
            //                children: [
            //                  Padding(
            //                    padding: const EdgeInsets.all(8.0),
            //                    child: Text('Event Name',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 18),),
            //                  ),
            //                ],
            //              ),
            //
            //
            //            ],
            //          ),
            //
            //        ],
            //      ),
            //    ),
            //    SingleChildScrollView(
            //      scrollDirection: Axis.horizontal,
            //      child: Row(
            //        children: [
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //
            //            children: [
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('start date |',style: TextStyle(fontSize: 12),),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('End date |'),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('Giza , Cairo , Egypt',style: TextStyle(fontSize: 12),),
            //
            //                ],
            //              )
            //            ],
            //          ),
            //          SizedBox(width: 5,),
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //
            //            children: [
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('start date |',style: TextStyle(fontSize: 12),),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('End date |'),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('Giza , Cairo , Egypt',style: TextStyle(fontSize: 12),),
            //
            //                ],
            //              )
            //            ],
            //          ),
            //        ],
            //      ),
            //    ),
            //    Container(
            //      width: double.infinity,
            //      margin: EdgeInsets.only(top: 18),
            //      height: 160,
            //      color: Color(0xFFfe9c56),
            //      child: Column(
            // children: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text('Join Our Amazing Community',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
            //   ),
            //  Padding(
            //    padding: const EdgeInsets.all(8.0),
            //    child: ListTile(
            //      title: Text('Through our website Users can create new accounts to be able to find all nearby events and book a ticket online so if you were interested what are you waiting for to create a new account!',style: TextStyle(color: Colors.white,fontSize: 15),
            //          ),
            //    ),
            //  )
            // ],
            //      ),
            //    ),
            //    Container(
            //        margin: EdgeInsets.only(top: 20,left: 30),
            //        child: Row(
            //          children: [
            //            Text('Newest Events ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            //          ],
            //        )),
            //    Container(
            //      margin: EdgeInsets.only(left: 10,top: 20),
            //      child: Row(
            //        mainAxisAlignment: MainAxisAlignment.start,
            //        children: [
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //            children: [
            //              ClipRRect(
            //                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            //                child: Image.asset('assets/unsplash4.jpg',height: 150,width: 230,fit: BoxFit.cover),),
            //              Row(
            //                children: [
            //                  Padding(
            //                    padding: const EdgeInsets.all(8.0),
            //                    child: Text('Event Name',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 18),),
            //                  ),
            //                ],
            //              ),
            //
            //            ],
            //          ),
            //          SizedBox(width: 8,),
            //
            //          Column(
            //            children: [
            //              ClipRRect(
            //                borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
            //                child: Image.asset('assets/unsplash4.jpg',height: 150,fit: BoxFit.cover,width: 130,),),
            //              Row(
            //                children: [
            //                  Padding(
            //                    padding: const EdgeInsets.all(8.0),
            //                    child: Text('Event Name',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 18),),
            //                  ),
            //                ],
            //              ),
            //
            //
            //            ],
            //          ),
            //
            //        ],
            //      ),
            //    ),
            //    SingleChildScrollView(
            //      scrollDirection: Axis.horizontal,
            //      child: Row(
            //        children: [
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //
            //            children: [
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('start date |',style: TextStyle(fontSize: 12),),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('End date |'),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('Giza , Cairo , Egypt',style: TextStyle(fontSize: 12),),
            //
            //                ],
            //              )
            //            ],
            //          ),
            //          SizedBox(width: 5,),
            //          Column(
            //            crossAxisAlignment: CrossAxisAlignment.start,
            //
            //            children: [
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('start date |',style: TextStyle(fontSize: 12),),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.access_time_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('End date |'),
            //                  SizedBox(width: 4,),
            //                  Text('2021-02-01 23:10:50',style: TextStyle(color: Color(0xFFFE6B02),fontWeight: FontWeight.bold,fontSize: 12),),
            //                ],
            //              ),
            //              SizedBox(height: 6,),
            //              Row(
            //                mainAxisAlignment: MainAxisAlignment.start,
            //                children: [
            //                  Icon(Icons.location_on_outlined,size: 15,color: Colors.grey,),
            //                  SizedBox(width: 5,),
            //                  Text('Giza , Cairo , Egypt',style: TextStyle(fontSize: 12),),
            //
            //                ],
            //              )
            //            ],
            //          ),
            //        ],
            //      ),
            //    ),

            Image.network(
                'https://wanderguide.net/assets/site/images/events/1.jpg'),
            FutureBuilder<List<MostSharing>>(
              future: sharing,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      height: 600,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Column(
                              children: [
                                Text(
                                    '${snapshot.data[index].details.descriptionAr}'),
                                Text(
                                    '${snapshot.data[index].details.addressId}'),
                              ],
                            ));
                          }));
                } else {
                  // return Center(child: CircularProgressIndicator());
                  return Text('kjkk');
                }
              },
            ),
            RaisedButton(
                child: Text(
                  'All Events',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                color: Color(0xFFFE6B02),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllEventsScreen()));
                })
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
                      // if(isSelected==true){
                      //   IconButton(icon: Icon(Icons.favorite,color: Colors.white));
                      // }else{
                      //   IconButton(icon: Icon(Icons.favorite_border_outlined,color: Colors.white));
                      // }
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
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                    },
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

class UserData {
  final String token;
  UserData(this.token);
}
