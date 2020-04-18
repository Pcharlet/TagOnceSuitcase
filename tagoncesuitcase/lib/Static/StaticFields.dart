import 'package:tagoncesuitcase/modele/User.dart';

class StaticField {

  static User user;
  static String uid;


  setUser(User unUser){
    user=unUser;
  }

  setUid(String unUid){
    uid= unUid;
  }

}