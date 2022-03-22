import 'package:anand_yogalaya/controllers/user_controller.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/homeScreen.dart';
import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:anand_yogalaya/utils/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';
import '../services/database.dart';
import '../utils/loading_widget.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  User? get user => firebaseUser.value;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    //googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    //ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      print('User is null in set initial screnn');
      //Get off removes all other screens and just opens the screen which is passed.
      Get.offAll(() => const LoginScreen());
    } else {
      print('User is  not null in set initial screnn');
      print('Fetching user data from firestore');

      UserModel userModel = await Database().getUser(auth.currentUser!.uid);

      // user created successfully
      Get.find<UserController>().user = userModel;
      Get.offAll(() => const HomepageScreen());
    }
  }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     Get.offAll(() => const LoginScreen());
  //   } else {
  //     Get.offAll(() => const HomepageScreen());
  //   }
  // }

  void signInWithGoogle() async {
    try {
      print('Entering sign in with google');
      Get.dialog(const Center(child: LoadingWidget()),
          barrierDismissible: false);
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credential).catchError((onError) {
          print('Error sign in with credential: $onError');
        });

        // Created User in DB
        UserModel _user = UserModel(
          id: auth.currentUser?.uid,
          name: auth.currentUser?.displayName,
          email: auth.currentUser?.email,
        );

        bool? newUser = await Database().createNewUser(_user);

        if (newUser == true) {
          // user created successfully
          Get.find<UserController>().user = _user;
          //Get.back();
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Logging In: $e',
          snackPosition: SnackPosition.BOTTOM);
      print('Error loggin user in: $e');
    }
  }

  void register(String email, password) async {
    try {
      print('Entering register new user');
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      print(
          "Error registering with email and password: $firebaseAuthException");
    }
  }

  void login(String email, password) async {
    try {
      print('Entering sign in with email and password');
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      print("Error logging with email and password: $firebaseAuthException");
    }
  }

  void signOut() async {
    try {
      Get.dialog(const Center(child: LoadingWidget()),
          barrierDismissible: false);
      await auth.signOut();
      await googleSign.disconnect();
      //This disposes the controller after signing user out.
      Get.find<UserController>().clear();
    } catch (e) {
      print('Error signing out user: $e');
    }
  }
}
