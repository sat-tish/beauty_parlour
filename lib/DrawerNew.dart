import 'package:flutter/material.dart';
class DrawerNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,

          ),

            new ListTile(
              leading: Icon(Icons.home, color: Colors.white,),
              title: new Text("Home",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white,),
              title: new Text("About Us",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.person, color: Colors.white,),
              title: new Text("Privacy Policy",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.content_paste, color: Colors.white,),
              title: new Text("Terms & conditions",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.contact_phone, color: Colors.white,),
              title: new Text("Call us",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.star, color: Colors.white,),
              title: new Text("Rate Us",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
            new ListTile(
              leading: Icon(Icons.input, color: Colors.white,),
              title: new Text("LogOut",style: TextStyle(color: Colors.white)),
//            onTap: () {
//              Navigator.popAndPushNamed(context, FirstScreen.id);
//            },
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
