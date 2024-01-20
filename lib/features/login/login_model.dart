class LoginModel {
  String userID;
  String email;
  String userName;
  String userSurname;
  int classGrade;

  LoginModel({
    required this.userID,
    required this.email,
    required this.userName,
    required this.userSurname,
    required this.classGrade,
  });

  LoginModel copyWith({
    String? userID,
    String? email,
    String? userName,
    String? userSurname,
    int? classGrade,
  }) {
    return LoginModel(
      userID: userID ?? this.userID,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      userSurname: userSurname ?? this.userSurname,
      classGrade: classGrade ?? this.classGrade,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'userName': userName,
      'userSurname': userSurname,
      'classGrade': classGrade,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userID: json['userID'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      userSurname: json['userSurname'] as String,
      classGrade: json['classGrade'] as int,
    );
  }

  @override
  String toString() =>
      "LoginModel(userID: $userID,email: $email,userName: $userName,userSurname: $userSurname,classGrade: $classGrade)";

  @override
  int get hashCode =>
      Object.hash(userID, email, userName, userSurname, classGrade);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginModel &&
              runtimeType == other.runtimeType &&
              userID == other.userID &&
              email == other.email &&
              userName == other.userName &&
              userSurname == other.userSurname &&
              classGrade == other.classGrade;
}
