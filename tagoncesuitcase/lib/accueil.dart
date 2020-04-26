import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tagoncesuitcase/Static/StaticFields.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:tagoncesuitcase/modele/User.dart';

class AccueilController extends StatefulWidget {
  @override
  _AccueilControllerState createState() => _AccueilControllerState();
}

class _AccueilControllerState extends State<AccueilController> {
  String uid;
  BannerAd _bannerAd;
  @override
  void initState() {
    setState(() {
      uid = StaticField.uid;
    });
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7251059686787277/2279637965');
    _bannerAd = _banner()
      ..load()
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("TagOnceSuitCase")),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection("users")
              .document('hWauzwO7tl8n6DJBYhxI')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              User user = User(snapshot.data);
              StaticField().setUser(user);
              return buildBody(context);
            }
          }),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text("Mettre Message, "),
          SizedBox(height: 20),
          //mettre Profil
          QrImage(
            //générer un token par user
            data: 'This is a simple QR code',
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          ),
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
          ),
          RaisedButton(
            child: new Text("J'ai trouvé une valise"),
            onPressed: () {
              
            },
          )
        ],
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
