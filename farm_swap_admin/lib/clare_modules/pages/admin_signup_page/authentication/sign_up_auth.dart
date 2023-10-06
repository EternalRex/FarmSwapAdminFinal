import 'package:firebase_auth/firebase_auth.dart';

class AdminAuth {
  final FirebaseAuth adminAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await adminAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user;
    } catch (e) {
      print("Error during registration: $e");
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await adminAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occured auth : $e");
      return null;
    }
  }
}
