import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';

class AccueilController extends StatefulWidget {
  @override
  _AccueilControllerState createState() => _AccueilControllerState();
}

class _AccueilControllerState extends State<AccueilController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
}
