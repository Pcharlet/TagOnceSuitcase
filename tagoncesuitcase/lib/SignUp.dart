import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';
import 'package:tagoncesuitcase/modele/firebase_service.dart';

class SignupForm extends StatelessWidget {
  String mail;
  String pwd;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              border: OutlineInputBorder(),
            ),
            onChanged: (String value){
              mail=value;
            },
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm password",
              border: OutlineInputBorder(),
            ),
            onChanged: (String value){
              pwd=value;
              
            },
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Signup"),
            onPressed: () {
              firebase_service().createAccount(mail, pwd, name);
              versAccueil(context);
            },
          ),
        ],
      ),
    );
  }
}