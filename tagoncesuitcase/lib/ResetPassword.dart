import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';
import 'package:tagoncesuitcase/modele/firebase_service.dart';

class ResetPasswordForm extends StatelessWidget {

String mail;

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
          const SizedBox(height: 5.0),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Réinitialiser"),
            onPressed: () {
              //envoie du mail
              firebase_service().emailReset(mail);
              AlertDialog(
                title: Text("Réinitialisation du mot de passe"),
                content: Text("Un Email vous a été envoyé"),
                actions: <Widget>[okButton(context)],
              );
            },
          ),
        ],
      ),
    );
  }

  FlatButton okButton(BuildContext context) {
  return new FlatButton(
      onPressed: () => Navigator.of(context).pop(), child: new Text("ok"));
}
}

