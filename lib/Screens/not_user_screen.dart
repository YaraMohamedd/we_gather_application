import 'package:flutter/material.dart';
import 'package:we_gather_application/Widgets/not_user_drawer.dart';
class NotUserScreen extends StatefulWidget {
  @override
  _NotUserScreenState createState() => _NotUserScreenState();
}

class _NotUserScreenState extends State<NotUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hh'),
      ),
     drawer: NotUserDrawer(),
    );
  }
}
