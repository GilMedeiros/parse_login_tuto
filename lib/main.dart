import 'package:flutter/material.dart';
import 'package:parse_login_tuto/home.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

//Keys from back4app
const String PARSE_APP_ID = 'YOUR_ID';

const String PARSE_APP_URL = 'https://parseapi.back4app.com';

const String MASTER_KEY = 'YOUR_KEY';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Parse().initialize(
    PARSE_APP_ID,
    PARSE_APP_URL,
    masterKey: MASTER_KEY,
    autoSendSessionId: true,
    debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );

runApp(MyApp());
} 

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParseServer Login demo',
      home: Home(),
    );
  }
}

