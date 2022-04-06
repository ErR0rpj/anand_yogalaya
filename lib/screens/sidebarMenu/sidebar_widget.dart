import 'package:anand_yogalaya/controllers/auth_controller.dart';
import 'package:anand_yogalaya/screens/webview_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/const.dart';

class NavsideBar extends GetWidget<AuthController> {
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
            color: Backgroundcolor,
            child: Center(
              child: Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: controller.user?.photoURL ??
                        'https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                        child: Shimmer.fromColors(
                      baseColor: kTextLightColor,
                      highlightColor: Colors.grey,
                      period: const Duration(seconds: 2),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: ShapeDecoration(
                            color: Colors.grey[700],
                            shape: const CircleBorder()),
                      ),
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.user?.displayName ?? '',
                    style: const TextStyle(fontSize: 22, color: kwhite),
                  ),
                  Text(
                    controller.user?.email ?? '',
                    style: const TextStyle(fontSize: 18, color: kwhite),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit_note_rounded),
            title: const Text('Register for Classes'),
            onTap: () => {
              Get.to(() => const WebViewScreen(
                  url: 'http://www.anandyogalaya.co.in/register.php')),
            },
          ),
          ListTile(
            leading: const Icon(Icons.image_rounded),
            title: const Text('Gallery'),
            onTap: () => {
              Get.to(() => const WebViewScreen(
                  url: 'http://www.anandyogalaya.co.in/gallery.html')),
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => {
              //TODO: Add link to share
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About us'),
            onTap: () => {
              Get.to(() => const WebViewScreen(
                  url: 'http://www.anandyogalaya.co.in/about.html')),
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_rounded),
            title: const Text('Contact us'),
            onTap: () => {
              Get.to(() => const WebViewScreen(
                  url: 'http://www.anandyogalaya.co.in/contact.php')),
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => {controller.signOut()},
          ),
        ],
      ),
    );
  }
}
