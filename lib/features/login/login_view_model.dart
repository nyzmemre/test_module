import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test_module/features/homepage/homepage_view.dart';
import 'package:test_module/features/login/email_verificiation.dart';
import 'package:test_module/services/login_services.dart';

class LoginViewModel extends ChangeNotifier {
  LoginServices loginServices=LoginServices();

  bool _isVisible=false;
  bool _isClickButton=false;
  bool _isEmailVerified=false;


  void visibleChange(){
    _isVisible=!_isVisible;
    notifyListeners();
  }

  void buttonClickChange(){
    _isClickButton=!_isClickButton;
    notifyListeners();
  }


  Future<void> singIn(String email, String password) async {
    try {
      await loginServices.singIn(email, password);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> registerUserAndAddToFirestore (
      {
      required BuildContext context,
      required String userName,
      required String userSurname,
      required String email,
      required String password,
      required int classGrade}) async {
    try {
      // Firebase Authentication ile kullanıcı oluşturma
      await loginServices.createUser(email, password);

      // Oluşturulan kullanıcının UID'sini al
      String uid = loginServices.getUserID() ?? '';

      // Firestore bağlantısı
      FirebaseFirestore _firestore = loginServices.firebaseFirestore;

      // Kullanıcı verilerini Firestore'a ekleme
      await _firestore.collection('users').doc(uid).set({
        'userName': userName,
        'userSurname': userSurname,
        'email': email,
        'classGrade': classGrade,
      });

      MotionToast.success(
        title: Text('Tebrikler'),
        description: Text('Kayıt başarıyla olşturuldu.'),
      ).show(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationView()));
      print('Kullanıcı başarıyla oluşturuldu ve Firestore\'a eklendi.');
    } catch (e) {
      MotionToast.error(
        title: Text('Hata'),
        description: Text('Bir sorun var gibi görünüyor. $e'),
      ).show(context);
      print('Hata oluştu: $e');
    }
  }

  Future<void> sendEmailVerification () async {
    await loginServices.emailVerification();
  }


  Future<void> checkEmailVerified(BuildContext context) async {
    await loginServices.firebaseAuth.currentUser?.reload();
    await sendEmailVerification();

      _isEmailVerified = loginServices.firebaseAuth.currentUser!.emailVerified;


    if (_isEmailVerified) {
      // TODO: implement your code after email verification
      MotionToast.success(
        title: Text('Tebrikler'),
        description: Text("Email Successfully Verified"),
      ).show(context);

    }
  }

  bool get isVisible=>_isVisible;
  bool get isClickButton=>_isClickButton;
  bool get isEmailVerified=>_isEmailVerified;


}