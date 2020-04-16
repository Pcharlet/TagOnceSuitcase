import 'package:flutter/material.dart';
import 'package:tagoncesuitcase/modele/FunctionsRoutes.dart';

class OrderQrCodeController extends StatefulWidget {
  @override
  _OrderQrCodeControllerState createState() => _OrderQrCodeControllerState();
}

class _OrderQrCodeControllerState extends State<OrderQrCodeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("Commander votre TagOnce")),
      ),
      body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            //mettre Profil
            Image(image: AssetImage('pictures/qrCode.png')),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.email),
                hintText: 'Your email address',
                labelText: 'E-mail',
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String value) {},
            ),
            SizedBox(height: 24.0),
            // "Life story" form.
            TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Adresse',
                  helperText: '',
                ),
                onSaved: (String value) {}),
            SizedBox(height: 15.0),
            // "Life story" form.
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Votre Message',
              ),
              onSaved: (String value) {},
              maxLines: 3,
            ),
            SizedBox(height: 5.0),

            RaisedButton(
              child: new Text("Commander votre QrCode"),
              onPressed: () {
                //enregistrer la cde en bdd
                //pop up validation ou non de la cde
                //retourner sur la page accueil
                //envoyer un mail de confirmation
                //empêcher de faire plusieurs commande simultané
                
              },
            )
          ],
        ),
      )),
    );
  }
}
