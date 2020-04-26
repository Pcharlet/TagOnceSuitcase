import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tagoncesuitcase/Static/StaticFields.dart';



class firebase_service{

  final FirebaseAuth auth_instance = FirebaseAuth.instance;


  logOut() => auth_instance.signOut();

  void myID() async {
    FirebaseUser user = await auth_instance.currentUser();
    print(user.uid);
    StaticField().setUid(user.uid);
  }

  void emailReset(String email) async {
    await auth_instance.sendPasswordResetEmail(email: email);
  }

  Future<FirebaseUser> signIn(String mail, String pwd) async {
    await auth_instance.signInWithEmailAndPassword(
        email: mail, password: pwd);
  }

  Future<FirebaseUser> createAccount(
    String mail, String pwd, String name) async {
    await auth_instance.createUserWithEmailAndPassword(email: mail, password: pwd);
    //Créer user for BDD
    Map<String, dynamic> map = {
      "name": name,
      "email": mail,
      "imageUrl": " ",
      "description": " ",
      "dateSubcribe": Timestamp.now(),
    };

    addUser( map);

  }

  addUser( Map<String, dynamic> map) async {
    await Firestore.instance.collection("users").document().setData(map);
  }


}