import 'package:flutter/material.dart';
class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.4),
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
                              Text('Pyramids Event',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ],
                          ),

                          Divider(
                            thickness: 2.5,
                          ),

                          // Container(
                          //     margin: EdgeInsets.only(left: 20,top: 20),
                          //     child: Row(
                          //       children: [
                          //         Text('Comments',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          //       ],
                          //     )),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          ListTile(
                            leading: Image.asset('assets/path6.png',height: 100,),
                            title:Text('Salma s esam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle:   Text('supreme'),

                          ),
                       Container(
                         margin: EdgeInsets.only(top:80,left: 10,right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Add comment',
                            suffixIcon: Icon(Icons.send_sharp,color: Color(0xFFFE6B02),),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                        ),
                       )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
