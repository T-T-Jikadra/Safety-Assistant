import 'package:fff/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth chanage user stream

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //crate user obj based on User ..
  myAppUser? _userFromUser(User? user) {
    if (user != null) {
      return myAppUser(uid: user.uid);
    } else {
      return null;
    }
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and pass

// register with email and pass

// sign out
}
