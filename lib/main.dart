import 'package:flutter/material.dart';
import 'package:parse_login_tuto/home.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

//Keys from back4app
const String PARSE_APP_ID = 'PDRmzMpVpkpwQ9oCOrlevTEg5lZ6i9Y4x7WGdJJy';

const String PARSE_APP_URL = 'https://parseapi.back4app.com';

const String MASTER_KEY = 'Kp45FC6SVuP85XSZFmLBntOEEiQyrfHnOx8ISAu1';


Future<void> main() async {

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

