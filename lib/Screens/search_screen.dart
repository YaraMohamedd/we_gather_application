import 'package:flutter/material.dart';
import 'package:we_gather_application/Screens/all_events_screen.dart';
import 'package:we_gather_application/Screens/favourite_screen.dart';
import 'package:we_gather_application/Screens/home_page_screen.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFE6B02),
        toolbarHeight: 70,
        title: Text(' Search',style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 60),
              child: Card(
                elevation: 3,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF272C48),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 200,
                        height: 30,
                        child: RaisedButton(onPressed: (){
                        },child: Text('Address',style: TextStyle(fontSize: 15),),),),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        width: 200,
                        height: 30,
                        child: RaisedButton(onPressed: (){
                        },child: Text('Owner',style: TextStyle(fontSize: 15),)),),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 200,
                          height: 30,
                          child: RaisedButton(onPressed: (){
                          },child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today,size:  20,),
                              SizedBox(width: 10,),
                              Text('Start',style: TextStyle(fontSize: 15),),
                            ],
                          ))),
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 200,
                          height: 30,
                          child: RaisedButton(onPressed: (){
                          },child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today,size:  20,),
                              SizedBox(width: 10,),
                              Text('End',style: TextStyle(fontSize: 15),),
                            ],
                          ))),
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          width: 200,
                          height: 30,
                          child: RaisedButton(
                              color: Colors.blue.shade800,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              onPressed: (){
                              },child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search,size:  15,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('Search',style: TextStyle(fontSize: 20,color: Colors.white),),
                            ],
                          )))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                  IconButton(icon: Icon(Icons.home,color: Colors.white,), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));

                  },),
                  Text('Home',style: TextStyle(color: Colors.white),)
                ],
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.favorite_border_outlined,color: Colors.white), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteScreen()));
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
                  IconButton(icon: Icon(Icons.event,color: Colors.white), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllEventsScreen()));
                  },),
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
