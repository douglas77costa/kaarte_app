import 'package:firebase_auth/firebase_auth.dart';

class EmailRepository {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> resetPassword(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
