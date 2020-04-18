import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/Static/StaticFields.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:tagoncesuitcase/modele/User.dart';

class AccueilController extends StatefulWidget {
  @override
  _AccueilControllerState createState() => _AccueilControllerState();
}

class _AccueilControllerState extends State<AccueilController> {

  BannerAd _bannerAd;
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7251059686787277/2279637965');
    _bannerAd = _banner()
      ..load()
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection("users").document(StaticField.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
      if(!snapshot.hasData){
        return CircularProgressIndicator();
      }else{
        User user= User(snapshot.data);
        StaticField().setUser(user);
        return scalfold(context);
      }
      });
  }

  Widget scalfold(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("TagOnceSuitCase")),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text("Bonjour, "),
            //mettre Profil
            Image(image: AssetImage('pictures/qrCode.png')),
            RaisedButton(
              child: new Text("Gestion de vos données"),
              onPressed: () {
                versSettings(context);
              },
            ),
            RaisedButton(
              child: new Text("Commander votre QrCode"),
              onPressed: () {
                versOrderQrCode(context);
              },
            )
          ],
        ),
      ),
    );
  }

  BannerAd _banner() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }
}
