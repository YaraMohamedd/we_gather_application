import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/my_event_page.dart';
import 'package:we_gather_application/New/sign_in.dart';
import 'package:we_gather_application/Screens/about_screen.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/event_details.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';
import 'package:we_gather_application/Screens/my_favourite_screen.dart';
import 'package:we_gather_application/Screens/not_user_screen.dart';
import 'package:we_gather_application/Screens/organization_screen.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/New/sign_up_screen.dart';
import 'package:we_gather_application/New/contact_us_screen.dart';
import 'package:we_gather_application/Screens/splash_screen.dart';
import 'package:we_gather_application/Screens/user_profile_screen.dart';
import 'package:we_gather_application/Utils/Langs/translations.dart';
import 'package:we_gather_application/config/size_config.dart';
import 'New/sign_in_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              translations: Translation(),
              locale: Locale('ar'),
              fallbackLocale: Locale('en'),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Color(0xFFFE4B02),
              ),
              home: FirstScreen(),
            );
          },
        );
      },
    );
  }
}
