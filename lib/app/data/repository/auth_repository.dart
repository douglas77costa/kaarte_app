import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<UserCredential?> login(String email, String password) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  static Future<UserCredential?> createAuth(
      String email, String password) async {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  static User? getAuthUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static bool isLogged(){
    if (_firebaseAuth.currentUser!= null) {
      return true;
    } else {
      return false;
    }
  }
}

class AuthError {
  static String USER_USED = "email-already-in-use";
  static String USER_NOT_FOUND = "user-not-found";
  static String WRONG_PASS = "wrong-password";

  static final Map<String, String> AUTH_ERROR = {
    USER_USED: "Usuário já está cadastrado",
    USER_NOT_FOUND: "Usuário não cadastrado",
    WRONG_PASS: "Senha incorreta",
  };
}
