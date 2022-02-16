
import 'package:flutter/material.dart';
import '../../utils/const.dart';
import '../Notifications/notificationlist.dart';
import '../Notifications/notificationspage.dart';
import '../login_screen.dart';
import '../workoutdetailScreen/detailScreen.dart';
import 'aboutUser.dart';

class NavsideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: kwhite,
      child: ListView(
      children: <Widget>[
        Container(
            width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Donebutton,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width*0.2,
                  height: size.width*0.2,
                  margin: EdgeInsets.only(
                    top: 18
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(urlImage),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    color: kwhite
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                      fontSize: 22,
                      color: kwhite
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Favorite'),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Detail Section'),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WorkoutDetails()),
            ),
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () => {Navigator.push( context, MaterialPageRoute(builder: (context) => NotificationPage()),),},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification'),
          onTap: () => {Navigator.push( context, MaterialPageRoute(builder: (context) => NotificationList()),),},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text('Policies'),
          onTap: () => null,
        ),
        Divider(),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.exit_to_app),
          onTap: () => { Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()),),
    },
        ),
      ],
    ),

    );
  }
}
