import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    _Userload();
    super.initState();
  }


//UserCredential
  ParseUser _parseUser;

//Check User credential -- initState();
  void _Userload() async {
    ParseUser currentUser = await ParseUser.currentUser(); //The current user was save in the phone with SharedPrefferences
    if (currentUser == null) {
      return null;
    } else {
      _parseUser = currentUser;
      print("AUTO LOGIN SUCCESS");
      var result = currentUser.login();
      result.catchError((e) {
        print(e);
      });
    }
  }

//Login
  Future<ParseUser> Login(username, pass, email) async {
    var user = ParseUser(username, pass, email);
    var response = await user.login();

    if (response.success) {
      setState(() {
        _parseUser = user; //Keep the user
      });
      print(user.objectId);
    } else {
      print(response.error.message);
    }
  }

//Sign UP
  Future<ParseUser> SignUP(username, pass, email) async {
    var user = ParseUser(username, pass,
        email); //You can add Collumns to user object adding "..set(key,value)"
    var result = await user.create();

    if (result.success) {
      setState(() {
        _parseUser = user; //Keep the user
      });
      print(user.objectId);
    } else {
      print(result.error.message);
    }
  }


//Controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Demo App')
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
                hintText: 'Username'
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(

                hintText: 'E-mail'
            ),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(
                hintText: 'Pass'
            ),
          ),
          FlatButton(
            child: Text('Login'),
            onPressed: () {
              Login(usernameController.text, passController.text,
                  emailController.text);
            },
          ),
          FlatButton(
            onPressed: () {
              SignUP(usernameController.text, passController.text,
                  emailController.text);
            },
            child: Text('Sign Up'),
          ),
          FlatButton(
            child: Text('Logout'),
            onPressed: ()async{
              var user = _parseUser;
              var response = await user.logout();
              if(response.success){
                _parseUser = null;
                print("LOGOFF SUCCESS");
                usernameController.clear();
                emailController.clear();
                passController.clear();
              } else{
                print(response.error.message);
              }
            },
          )
        ],
      ),
    );
  }

}