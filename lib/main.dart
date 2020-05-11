import 'package:flutter/material.dart';
import 'package:flutternightmode/values/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutternightmode/theme_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(),
      child: MaterialAppWithTheme()
    );
  }
}
class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      title: 'Flutter Demo',
      theme: Styles.themeData(false, context),
    //  theme: ThemeData.light(),
      darkTheme: Styles.themeData(true, context),

      themeMode: themeManager.themeMode,
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeManager _themeManager;
  var text, buttonText;
  var val;
  void _incrementCounter() {
    setState(() {

      if (_themeManager.themeMode == ThemeMode.dark)
        {
          val = ThemeMode.light;
          text = "Dark Mode";
          buttonText = "Light Mode";
        }
      else{
        val = ThemeMode.dark;
        text = "Light Mode";
        buttonText = "Dark Mode";
      }


      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //
      _updateTheme(val);

    });
  }
  @override
  void initState() {
    super.initState();
    _themeManager = Provider.of<ThemeManager>(context, listen: false);

    if (_themeManager.themeMode == ThemeMode.dark)
    {
      val = ThemeMode.light;
      text = "Dark Mode";
      buttonText = "Light Mode";
    }
    else{
      val = ThemeMode.dark;
      text = "Light Mode";
      buttonText = "Dark Mode";
    }
  }

  void _updateTheme(ThemeMode themeMode) {
    _themeManager.themeMode = themeMode;
  }



  @override
  Widget build(BuildContext context) {

    //    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
    return ChangeNotifierProvider<ThemeManager>(
      create: (context) => ThemeManager(),
      child: Scaffold(

        appBar: AppBar(
          title: Text('NightModeFlutter'),
          elevation: 0.0,//remove shadow from app bar
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/teddy.png'),
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'App $text',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/flutterlogo.png'),
                    radius: 32.0,
                  )
                ],
              ),
              SizedBox(height: 32.0),
              Text(
                'Lorem ipsum dolor \n'
                    'sit amet consetetur',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: _incrementCounter,
                  child: Text(
                    'Enable $buttonText',
                    style: TextStyle(
                      fontSize: 16.0,

                    ),
                  ),
                  shape: StadiumBorder(),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

}
