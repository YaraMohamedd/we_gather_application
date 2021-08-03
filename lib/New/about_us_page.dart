import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272C48),
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/wegather.png',
              height: 200,
              width: 400,
              fit: BoxFit.cover,
            ),
            Text(
              'مهمتنا',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                'قم بتشكيل مستقبل تقديم تجارب حية رائعة من خلال إنشاء نموذج لوحة سهل الوصول إليه لربط الأشخاص المتحمسين بالمنظمين المبدعين ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Text(
              'من نحن',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                'قم بتشكيل مستقبل تقديم تجارب حية رائعة من خلال إنشاء نموذج لوحة سهل الوصول إليه لربط الأشخاص المتحمسين بالمنظمين المبدعين   ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFE4B02),
              ),
              child: Column(
                children: [
                  Text('تواصل معنا',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('0199937766 ',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('0199937766 ',
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
