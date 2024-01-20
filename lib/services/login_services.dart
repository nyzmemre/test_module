import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';

class LoginServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUser(String email, String password) async {
    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == TextConstant.passwordWeak) {
        print(TextConstant.passwordWeakToast);
      } else if (e.code == TextConstant.emailAlreadyUse) {
        print(TextConstant.emailAlreadyUseToast);
      }
    }
  }
}
