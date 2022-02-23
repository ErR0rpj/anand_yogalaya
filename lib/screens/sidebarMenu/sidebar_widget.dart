import 'package:flutter/material.dart';
import '../../utils/const.dart';
import '../Notifications/notificationlist.dart';
import '../Notifications/notificationsdetailpage.dart';
import '../login_screen.dart';
import 'aboutUser.dart';

class NavsideBar extends StatelessWidget {
  const NavsideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: kwhite,
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Donebutton,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    margin: const EdgeInsets.only(top: 18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(urlImage), fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 22, color: kwhite),
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 22, color: kwhite),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationList()),
              ),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              //TODO: Implement logout
            },
          ),
        ],
      ),
    );
  }
}
