import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:we_gather_application/Controllers/local_storage/app_language.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/sign_up_screen.dart';
import 'package:we_gather_application/New/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _chosenValue;
  int _value = 1;
  String myString;
  String _selectedLang = 'en';
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }

  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loadCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Account'.tr,
            style: TextStyle(
                color: Color(0xFF272C48),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          centerTitle: true,
          // leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Icon(Icons.arrow_back_ios)),
          actions: [
            // Icon(Icons.)
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .65,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .15,
                left: MediaQuery.of(context).size.height * .02,
                right: MediaQuery.of(context).size.height * .02),
            child: Card(
              elevation: 3,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: DropdownButton(
                  //     // underline: true,
                  //     value: _value,
                  //     hint: Text('Register as'),
                  //     //disabledHint: Text('Register as'),
                  //     items: [
                  //       DropdownMenuItem(
                  //         child: Text("User"),
                  //         value: 1,
                  //       ),
                  //       DropdownMenuItem(
                  //         child: Text("Organizer"),
                  //         value: 2,
                  //       ),
                  //     ],
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _value = value;
                  //       });
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF272C48)),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: _chosenValue,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black),
                            items: <String>[
                              'User'.tr,
                              'Organizer'.tr,
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            iconEnabledColor: Colors.white,
                            hint: Text(
                              "Register as".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue == value
                                    ? Text(
                                        '${_chosenValue}',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        '${_chosenValue}',
                                        style: TextStyle(color: Colors.black),
                                      );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF272C48)),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: _chosenValue,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black),
                            items: <String>[
                              'User'.tr,
                              'Admin'.tr,
                              'Organizer'.tr,
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            iconEnabledColor: Colors.white,
                            hint: Text(
                              "Sign In as".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue == value
                                    ? Text(
                                        '${_chosenValue}',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        '${_chosenValue}',
                                        style: TextStyle(color: Colors.black),
                                      );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<AppLanguage>(
                    init: AppLanguage(),
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 70, right: 70),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF272C48),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.white)),
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: DropdownButton(
                                iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: myString,
                                onChanged: (value) async {
                                  controller.changeLanguage(value);
                                  setState(() {
                                    _selectedLang = value;
                                  });
                                  Get.updateLocale(Locale(value));
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('value', value);
                                  //  print(value);
                                  SharedPreferences x =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    myString = x.getString('value');
                                    print("shared:$myString");
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        color: Color(0xFF272C48),
                                        child: Center(
                                          child: Text(
                                            'English',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      value: 'en'),
                                  DropdownMenuItem(
                                      child: Container(
                                          height: 30,
                                          width: 100,
                                          color: Color(0xFF272C48),
                                          child: Center(
                                              child: Text('العربيه',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)))),
                                      value: 'ar')
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
