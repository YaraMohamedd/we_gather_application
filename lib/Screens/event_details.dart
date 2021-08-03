import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_gather_application/Screens/comment_screen.dart';
class EventDetailsScreen extends StatefulWidget {
  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/pyramid.jpg',width: double.infinity,height: MediaQuery.of(context).size.height*.5,fit: BoxFit.cover,),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.4,left: 30,right: 30),
                  height: MediaQuery.of(context).size.height*.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Pyramids Event',style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.access_time,size: 15,),
                                SizedBox(width: 10,),
                                Text('12 january,2021 | 12:00')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.dangerous,size: 15,),
                                SizedBox(width: 10,),
                                Text('12 january,2021 | 12:00')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.location_on_outlined,size: 15,),
                                SizedBox(width: 10,),
                                Text('Giza, Cairo, Egypt')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.money,size: 15,),
                                SizedBox(width: 10,),
                                Text('200 s')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.confirmation_number_outlined,size: 15,),
                                SizedBox(width: 10,),
                                Text('All tickets 2000')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.confirmation_number_outlined,size: 15,),
                                SizedBox(width: 10,),
                                Text('Available tickets 2000')
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset('assets/path6.png'),
                                      backgroundColor: Colors.white ,
                                      radius: 40,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: CircleAvatar(
                                        child: Image.asset('assets/path6.png'),
                                        backgroundColor: Colors.white ,
                                        radius: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 80),
                                      child: CircleAvatar(
                                        child: Image.asset('assets/path6.png'),
                                        backgroundColor: Colors.white ,
                                        radius: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 160),
                                      child: Column(
                                        children: [
                                          Text('+ 10 likes',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                          Text('this event',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          Image.asset('assets/map.jpg',height: 400,fit: BoxFit.cover,),
                          Container(
                            margin: EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text('Overview',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text('Almost before we knew it, we had left the ground.'),
                                SizedBox(height: 5,),
                                Text('Almost before we knew it, we had left the ground.'),
                                SizedBox(height: 5,),
                                Text('Almost before we knew it, we had left the ground.'),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text('Category',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          Row(
                            children: [
                              SizedBox(width: 15,height: 30,),
                              Text('Lorem ispum'),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text('Organizer',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/hero.jpg',height: 100,width: 100,fit: BoxFit.cover),),
                              title: Text('MR Smith Danel',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('M@M.com',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal)),
                                        SizedBox(width: 10,),
                                        RaisedButton(
                                          color: Color(0xFFFE6B02),
                                          shape: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide.none
                                          ),
                                          child: Text('Follow',style: TextStyle(color: Colors.white),),
                                            onPressed: (){})
                                      ],
                                    ),
                                     
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text('Sponsers',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*.15,
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset('assets/temporaryimg.png'),
                                      Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('s@gmail.com')

                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Image.asset('assets/temporaryimg.png'),
                                      Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('s@gmail.com')

                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Image.asset('assets/temporaryimg.png'),
                                      Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('s@gmail.com')

                                    ],
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Image.asset('assets/temporaryimg.png'),
                                      Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text('s@gmail.com')

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text('Comments',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ],
                              )),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          ),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          ),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          )

                        ],
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(20,MediaQuery.of(context).size.height*.84),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(

                        elevation: 3,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.comment,color: Colors.black,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentScreen()));
                          }),
                      RaisedButton(
                        elevation: 3,
                          color: Color(0xFFFE6B02),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none
                          ),
                          child: Text('Book',style: TextStyle(color: Colors.white),),
                          onPressed: (){

                          })
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
