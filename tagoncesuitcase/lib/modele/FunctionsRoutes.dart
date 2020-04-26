import '../SignUp.dart';
import '../Login.dart';
import 'package:flutter/material.dart';
import '../accueil.dart';
import '../MainAppController.dart';
import 'package:tagoncesuitcase/OrderQrCode.dart';
import 'package:tagoncesuitcase/Settings.dart';

void versLogin() {}

void versSignUp(BuildContext context) {}

void versOrderQrCode(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (BuildContext context) {
    return new OrderQrCodeController();
  }));
}

void versAccueil(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (BuildContext context) {
    return new AccueilController();
  }));
}

verModificationProfil(){
  
}

void versSettings(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (BuildContext context) {
    return new SettingsOnePage();
  }));
}

void versMainApp(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (BuildContext context) {
    return new MainAppController();
  }));
}
