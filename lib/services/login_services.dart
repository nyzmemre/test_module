import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';

class LoginServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUser(String email, String password) async {
    try {
     await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == TextConstant.passwordWeak) {
        print(TextConstant.passwordWeakToast);
      } else if (e.code == TextConstant.emailAlreadyUse) {
        print(TextConstant.emailAlreadyUseToast);
      }
    }
  }

  String? getUserID() {
    User? user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  Future<void> singIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> emailVerification() async {
    try{
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw e;
    }
  }

  FirebaseAuth get firebaseAuth => _firebaseAuth;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;
}
