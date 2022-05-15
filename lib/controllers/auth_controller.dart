import 'package:anand_yogalaya/controllers/user_controller.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/homeScreen.dart';
import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:anand_yogalaya/utils/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import '../services/database.dart';
import '../utils/loading_widget.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseApp? firebaseApp;
  User? firebaseUser;
  FirebaseAuth? firebaseAuth;

  User? get user => firebaseUser;

  Future<void> initializeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<Widget> checkUserLoggedIn() async {
    if (firebaseApp == null) {
      await initializeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth?.currentUser == null) {
      return const LoginScreen();
    } else {
      firebaseUser = firebaseAuth?.currentUser!;

      String? uid = firebaseAuth?.currentUser?.uid;
      print("UID IS __________ ${uid}");
      UserModel userModel = await Database().getUser(uid!);
      Get.find<UserController>().user = userModel;
      update();
      return const HomepageScreen();
    }
  }

  void signInWithGoogle() async {
    try {
      Get.dialog(const Center(child: LoadingWidget()),
          barrierDismissible: false);

      if (firebaseApp == null) {
        await initializeFirebaseApp();
      }
     // await initializeFirebaseApp();

      firebaseAuth = FirebaseAuth.instance;

      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredentialData.user!;

      // Created User in DB
      UserModel _user = UserModel(
        id: firebaseUser?.uid,
        name: firebaseUser?.displayName,
        email: firebaseUser?.email,
      );

      bool newUser = await Database().checkIfUserExists(_user);

      if (newUser == false) {
        // user created successfully
        await Database().createNewUser(_user);
        Get.find<UserController>().user = _user;
        //Get.back();
      } else {
        String? uid = firebaseAuth?.currentUser?.uid;
        print("UID IS __________ ${uid}");
        UserModel userModel = await Database().getUser(uid!);
        Get.find<UserController>().user = userModel;
      }

      update();
      Get.back();
      Get.off(() => const HomepageScreen());
    } catch (e) {
      Get.back();
      Get.snackbar('Sign In Error', 'Error Signing in',
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.black,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ));
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
      await firebaseAuth?.signOut();
      await googleSign.disconnect();
      authController.onClose();
      //This disposes the controller after signing user out.
      Get.find<UserController>().clear();

      Get.back();

      // Navigate to Login again
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      print('Error signing out user: $e');
    }
  }
}
