import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:test_module/features/homepage/homepage_view.dart';
import 'package:test_module/features/level/level_view.dart';
import 'package:test_module/features/login/email_verificiation.dart';
import 'package:test_module/features/login/login_view.dart';
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


  Future<void> singIn(BuildContext context, String email, String password) async {
    try {
      await loginServices.singIn(email, password);
      if(loginServices.firebaseAuth.currentUser!=null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LevelView()), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      MotionToast.error(description: Text(e.toString()), ).show(context);
    }
  }

  Future<void> createUser(BuildContext context, String email, String password)async{
    try{
      await loginServices.createUser(email, password);


    } catch (e){

      MotionToast.error(
          description: Text('Hata $e')).show(context);
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
      User? user= loginServices.firebaseAuth.currentUser;
      String? uid = user?.uid;
      print(uid);
      // Firestore bağlantısı
      await sendEmailVerified();
      await loginServices.firebaseFirestore.collection('users').doc(uid).set({
        'userName': userName,
        'userSurname': userSurname,
        'email': email,
        'classGrade': classGrade,
      }); // Kullanıcı verilerini Firestore'a ekleme

      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationScreen()));
      /* MotionToast.success(
          title: Text('Tebrikler'),
          description: Text('Kayıt başarıyla olşturuldu.'),
        ).show(context);*/
      print('Kullanıcı başarıyla oluşturuldu ve Firestore\'a eklendi.');






    } catch (e) {
      MotionToast.error(
        title: Text('Hata'),
        description: Text('Bir sorun var gibi görünüyor. $e'),
      ).show(context);
      print('Hata oluştu: $e');
    }
  }

  Future<void> sendEmailVerified()async {
    print('gitti');
    await loginServices.emailVerification();
  }



  Future<void> checkEmailVerified(BuildContext context) async {
    if (_isEmailVerified) {
      // TODO: implement your code after email verification
      MotionToast.success(
        title: Text('Tebrikler'),
        description: Text("Kaydınız tamamlandı, lütfen giriş yapınız."),
      ).show(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
    }else {
      await loginServices.firebaseAuth.currentUser?.reload();
      print(loginServices.firebaseAuth.currentUser?.uid);
      if(loginServices.firebaseAuth.currentUser!=null) {
        print('reload');
        _isEmailVerified = loginServices.firebaseAuth.currentUser!.emailVerified;
        print(_isEmailVerified);
      } else {
        sendEmailVerified();
      }
    }
  }

  bool get isVisible=>_isVisible;
  bool get isClickButton=>_isClickButton;
  bool get isEmailVerified=>_isEmailVerified;


}