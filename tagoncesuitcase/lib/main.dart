import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/MainAppController.dart';
import 'package:tagoncesuitcase/Static/StaticFields.dart';
import 'package:tagoncesuitcase/accueil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TagOnceSuitsCase',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainAppController(),
    );
  }

  Widget _handleAuth(){
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot){
          if (snapshot.hasData){
            StaticField().setUid(snapshot.data.uid);
            return new AccueilController();
          }else{
            return new MainAppController();
          }
        }
    );
  }
  
}