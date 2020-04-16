import '../SignUp.dart';
import '../Login.dart';
import 'package:flutter/material.dart';
import '../MainAppController.dart';

void versLogin(){

}

void versSignUp(BuildContext context){
  
}

void versMainApp(BuildContext context){
  Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new MainAppController();
    }));
}