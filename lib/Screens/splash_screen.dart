import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:we_gather_application/New/home_page.dart';
import 'package:we_gather_application/New/sign_in.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 10,
          backgroundColor: Colors.white,
          navigateAfterSeconds: HomePage(),
          loaderColor: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: Container(
            //     height: 150,
            //     width: 150,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("assets/khalil.jpg"),
            //             fit: BoxFit.contain
            //         )
            //     ),
            //   ),
            // ),
            // https://assets8.lottiefiles.com/packages/lf20_qyh0rx6t.json
            Center(
              child: Lottie.network(
                'https://assets4.lottiefiles.com/private_files/lf30_rupg3acu.json',
                height: 500.0,
                width: 400,
                repeat: true,
                reverse: true,
                animate: true,
              ),
            ),
            // Center(
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     child: FlareActor(
            //       "assets/loading.flr",
            //       animation: "loading",
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
    // return Stack(
    //  children: [
    //   new SplashScreen(
    //    seconds: 5,
    //    navigateAfterSeconds: new HomePageScreen(),
    //    backgroundColor: Color(0xFFFE6B02),
    //    loaderColor: Colors.transparent,
    //   ),
    //   Transform.translate(
    //    offset: Offset(0,200),
    //    child: Column(
    //     children: [
    //      Center(
    //       child: Image.asset(
    //        'assets/wegather.png',height: 200,width:400,fit: BoxFit.cover,),
    //      ),
    //      Text('Wander guide',style: TextStyle(color: Colors.white,decoration: TextDecoration.none,fontWeight: FontWeight.bold),)
    //     ],
    //    ),
    //   ),

    //  ],
    // );
  }
}
