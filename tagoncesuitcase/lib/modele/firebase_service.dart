import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class firebase_service{

  final FirebaseAuth auth_instance = FirebaseAuth.instance;


  logOut() => auth_instance.signOut();

  Future<String> myID() async {
    FirebaseUser user = await auth_instance.currentUser();
    return user.uid;
  }

  void emailReset(String email) async {
    await auth_instance.sendPasswordResetEmail(email: email);
  }

  Future<FirebaseUser> signIn(String mail, String pwd) async {
    auth_instance.signInWithEmailAndPassword(
        email: mail, password: pwd);
  }

  Future<FirebaseUser> createAccount(
    String mail, String pwd, String name) async {
    auth_instance.createUserWithEmailAndPassword(email: mail, password: pwd);

    String uid = myID().toString();
    //Créer user for BDD
    Map<String, dynamic> map = {
      "name": name,
      "email": mail,
      "imageUrl": " ",
      "uid": uid,
      "description": " ",
      "dateSubcribe": Timestamp.now(),
    };

    addUser(uid, map);

  }

  addUser(String uid, Map<String, dynamic> map) async {
    await Firestore.instance.collection("users").document(uid).setData(map);
  }

}