import 'package:flutter/material.dart';

@immutable
class TextConstant{
  const TextConstant._();
  static const String appName='App Name';
  static const String solvedTEXT='Çözüm';
  static const String trueTEXT='Doğru';
  static const String falseTEXT='Yanlış';
  static const String solveTEXT='Çözüm';
  static const String tipTEXT='İpucu';
  static const String exitTEXT='Kapat';
  static const String login='Giriş';
  static const String profile='Profil';
  static const String signUp='Kayıt Ol';
  static const String signIn='Giriş Yap';
  static const String name='İsim';
  static const String surname='Soyisim';
  static const String password='Şifre';
  static const String passwordAgain='Şifre Tekrar';
  static const String hidePassword='Şifreyi gizle';
  static const String showPassword='Şifreyi göster';
  static const String mailAdress='Mail Adresi';
  static const String or='----- Veya -----';


  ///buttons text
  static const String startTEXT='Başla';
  static const String profileTEXT='Profil';
  static const String pointsTEXT='Puanlar';
  static const String settingsTEXT='Ayarlar';





  ///answer text
  static const String answA='A';
  static const String answB='B';
  static const String answC='C';
  static const String answD='D';

  ///groupCategory
  static const String easyCATEGORY='Basit';
  static const String normalCATEGORY='Orta';
  static const String difficultCATEGORY='Zor';

  ///mascotTexts
  static const String mascotText1='Merhaba, Hoşgeldin! Seninle keyifli zaman geçireceğiz. '
      'Bu uygulama bir eğitim uygulamasıdır. '
      'Seni daha yakından tanıyarak daha doğru ilerlemene yardımcı olmaya çalışacağım. '
      'Haydi başlayalım.';
  static const String mascotTextSelectClass='Sınıf seviyeni seç';
  static const String mascotTextBeforExamStatus='Daha önce sınava girdin mi?';

  ///form Error Texts
  static const String notEmpty='alanı boş olamaz.';
  static const String validateEmail='Lütfen geçerli bir mail adresi giriniz!';
  static const String validatePassword='Lütfen şifrenizi giriniz!';
  static const String passwordNotSame='Şifreleriniz aynı olmalıdır.';
  static const String mailNotEmptyError='Mail adresi boş olamaz!';
  static const String beCareful='Dikkat';
  static const String isInfoTrue='Bilgileri doğru girdiğinizden emin olun!';

  ///Firebase Error Texts
  static const String signInSuccesToast='Kaydınız başarıyla oluşturuldu.';
  static const String passwordWeak='weak-password';
  static const String passwordWeakToast='Lütfen daha güçlü bir parola seçiniz.';
  static const String emailAlreadyUse='email-already-in-use';
  static const String emailAlreadyUseToast='Email adresi zaten kullanılıyor.';
}