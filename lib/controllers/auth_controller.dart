import 'package:anand_yogalaya/controllers/user_controller.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/homeScreen.dart';
import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:anand_yogalaya/utils/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      //Get off removes all other screens and just opens the screen which is passed.
      Get.offAll(() => const LoginScreen());
    } else {
      Get.off(() => const HomepageScreen());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomepageScreen());
    }
  }

  void signInWithGoogle() async {
    try {
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
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Logging In: $e',
          snackPosition: SnackPosition.BOTTOM);
      print('Error loggin user in: $e');
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      print(
          "Error registering with email and password: $firebaseAuthException");
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      print("Error logging with email and password: $firebaseAuthException");
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await googleSign.disconnect();
      //This disposes the controller after signing user out.
      Get.find<UserController>().clear();
    } catch (e) {
      print('Error signing out user: $e');
    }
  }
}
