import 'package:flutter/material.dart';
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
      title: Text('About WounderGuide'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Center(child: Container(
                  margin: EdgeInsets.only(top: 20),
                    child: Text('Our Mission',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),))),
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: ListTile(
                    title: Text('Shape the future of delivering great live experiences by creating easy and accessible plate form to link passionate people with creative organizers.'
                    ,style: TextStyle(color: Colors.black,fontSize: 18),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                       height: 200,width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE6B02),
                    borderRadius: BorderRadius.circular(20),
                  ),
                        child: Container(
                          margin: EdgeInsets.only(top: 25,left: 10),
                          child: ListTile(
                            title: Column(
                              children: [
                                Text('“Ut justo suspendisse potenti. Sed vel lacus mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus.”'
                                  ,style: TextStyle(color: Colors.white,fontSize: 14),),
                                Row(
                                  children: [
                                    Text('-John s Dary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 200,width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFFE6B02),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 25,left: 10),
                          child: ListTile(
                            title: Column(
                              children: [
                                Text('“Ut justo suspendisse potenti. Sed vel lacus mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus.”'
                                  ,style: TextStyle(color: Colors.white,fontSize: 14),),
                                Row(
                                  children: [
                                    Text('-John s Dary',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('Who we are?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),))),
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: ListTile(
                    title: Text('WanderGuide is an international platform for live experiences that provide organizers with manage, advertise and online ticket selling services to passionate people whom want to fuel their passion, enhance their lives and discovering new things. '
                      ,style: TextStyle(color: Colors.black,fontSize: 18),),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(70,160),
              child: CircleAvatar(
                child: Image.asset('assets/path6.png'),
                backgroundColor: Colors.white ,
                radius: 20,
              ),
            ),
            Transform.translate(
              offset: Offset(240,160),
              child: CircleAvatar(
                child: Image.asset('assets/path6.png'),
                backgroundColor: Colors.white ,
                radius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
