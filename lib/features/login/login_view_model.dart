import 'package:flutter/material.dart';
import 'package:test_module/services/login_services.dart';

class LoginViewModel extends ChangeNotifier {
  LoginServices loginServices=LoginServices();

  bool _isVisible=false;

  void visibleChange(){
    _isVisible=!_isVisible;
    notifyListeners();
  }

  createUser(String userID, String email, String password, String userName, String userSurname, int classGrade){
    loginServices.createUser(email, password);
  }


  bool get isVisible=>_isVisible;

}