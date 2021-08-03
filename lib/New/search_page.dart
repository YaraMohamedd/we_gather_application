import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/tab_item.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<http.Response> sendRequest() async {
    Map data = {
      'city': city,
      'owner': category,
      'event_start_date': '2021-06-25 12:50:00',
      'event_end_date': '2021-06-25 14:50:00'
    };
    var body = json.encode(data);
    var url = 'https://wanderguide.net/api/search';
    await http
        .post(
      url,
      body: body,
    )
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }

  int selectedPosition = 0;
  final tabs = ['الرئيسيه', 'مفضله', 'حجوزاتي', 'اكتشف', 'حسابي'];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double _height;
  double _width;
  String _setTime, _setDate;
  Color color;
  String city;
  String category;
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
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFFE4B02),
          toolbarHeight: 70,
          title: Text(
            ' Search',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: DropdownButton<String>(
                                  hint: Text('select city'),
                                  value: city,
                                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                                  iconSize: 30,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: SizedBox(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      city = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'cairo',
                                    'Alex',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: DropdownButton<String>(
                                  hint: Text('select category'),
                                  value: category,
                                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                                  iconSize: 30,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.black),
                                  underline: SizedBox(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      category = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'entertainment',
                                    'Fair',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _selectDate(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Start',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ))),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _selectDate(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'End',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ))),
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                              color: Color(0xFFFE4B02),
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                sendRequest();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyEventPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
              )
            ],
          ),
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
                  isSelected: false,
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
