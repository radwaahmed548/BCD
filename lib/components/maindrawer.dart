import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/models/login_auth.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Kgradintstartcolor,
        child: ListView(
          padding: EdgeInsets.only(
            top: 0,
          ),
          physics: ScrollPhysics(),
          key: const PageStorageKey<String>('key_app_drawer'),
          children: [
            Container(
              color: KMainColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/7-512.png'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Provider.of<Auth>(context).userName,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
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
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: ListTile(
                title: Row(children: [
                  Icon(Icons.supervised_user_circle),
                  Text('  Profile'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Community');
              },
              child: ListTile(
                title: Row(children: [
                  Icon(Icons.post_add_sharp),
                  Text('  community'),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/helpcenter');
              },
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
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: ListTile(
                title: Row(
                  children: [
                    Text(' '),
                    Icon(Icons.logout),
                    Text(' Logout'),
                  ],
                ),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
