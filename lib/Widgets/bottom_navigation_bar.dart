import 'package:flutter/material.dart';
import 'package:we_gather_application/Screens/search_screen.dart';
import 'package:we_gather_application/Widgets/my_drawer.dart';
class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      key: scaffoldKey,
      body: BottomAppBar(
        child: Container(
          height: 75.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Color(0xFFFE6B02),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  IconButton(icon: Icon(Icons.home,color: Colors.white,), onPressed: (){},),
                  Text('Home',style: TextStyle(color: Colors.white),)
                ],
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.favorite_border_outlined,color: Colors.white), onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                    // if(isSelected==true){
                    //   IconButton(icon: Icon(Icons.favorite,color: Colors.white));
                    // }else{
                    //   IconButton(icon: Icon(Icons.favorite_border_outlined,color: Colors.white));
                    // }
                  },),
                  Text('Favourite',style: TextStyle(color: Colors.white))
                ],
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));

                  },),
                  Text('Search',style: TextStyle(color: Colors.white))

                ],
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.event,color: Colors.white), onPressed: (){},),
                  Text('Events',style: TextStyle(color: Colors.white))
                ],
              ),
              Column(

                children: [
                  IconButton(icon: Icon(Icons.person_outline,color: Colors.white), onPressed: (){
                    scaffoldKey.currentState.openDrawer();
                  },),
                  Text('Profile',style: TextStyle(color: Colors.white))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
