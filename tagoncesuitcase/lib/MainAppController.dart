import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Login.dart';
import 'SignUp.dart';

class MainAppController extends StatefulWidget {

  @override
  _MainAppControllerState createState() => _MainAppControllerState();
}

class _MainAppControllerState extends State<MainAppController> {
  bool formVisible;
  int _formsIndex;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('airport.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black54,
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight + 40),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Bienvenue",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Welcome to this awesome login app. \n You are awesome",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Login"),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.grey.shade700,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Signup"),
                        onPressed: () {
                          setState(() {
                            formVisible = true;
                            _formsIndex = 2;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
                const SizedBox(height: 40.0),
                OutlineButton.icon(
                  borderSide: BorderSide(color: Colors.red),
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text("Continue with Google"),
                  onPressed: () {},
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: (!formVisible)
                ? null
                : Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              textColor: _formsIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              color:
                                  _formsIndex == 1 ? Colors.red : Colors.white,
                              child: Text("Login"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RaisedButton(
                              textColor: _formsIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              color:
                                  _formsIndex == 2 ? Colors.red : Colors.white,
                              child: Text("Signup"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                setState(() {
                                  _formsIndex = 2;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  formVisible = false;
                                });
                              },
                            )
                          ],
                        ),
                        Container(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                                _formsIndex == 1 ? LoginForm() : SignupForm(),
                          ),
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}