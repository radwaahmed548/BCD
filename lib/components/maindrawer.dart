import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(

        color: Colors.white,
        child: ListView(

          padding: EdgeInsets.only(top:0,),
          physics: ScrollPhysics(),
          key: const PageStorageKey<String>('key_app_drawer'),
          children: [
            Container(
              color: KMainColor,
            child: Padding(
              padding: const EdgeInsets.only(top:90.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/7-512.png'),
                  ),
                  SizedBox(height: 5,),
                  Text('Menna mohamed',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)


                ],
              ),
            ),
            ),
            GestureDetector(
              onTap: (){ Navigator.pushNamed(context, '/home');} ,
              child: ListTile(

                title: Row(
                  children: [

                    Icon(Icons.home_filled),

                    Text('  Home'),
                  ],
                ),

              ),
            ),
            GestureDetector(
              child: ListTile(

                title: Row(
                  children: [

                    Icon(Icons.supervised_user_circle),

                    Text('  Profile'),

                  ]
                ),

              ),
            ),
            GestureDetector(
              //onTap: (),
              child: ListTile(

                title: Row(
                  children: [

                    Icon(Icons.help),

                    Text('  help center'),
                  ],
                ),

              ),
            ),
            GestureDetector(
              onTap: (){ Navigator.pushNamed(context, '/');} ,
              child: ListTile(

                title: Row(
                  children: [
                    Text(' '),
                    Icon(Icons.logout),

                    Text(' Logout'),
                  ],
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
