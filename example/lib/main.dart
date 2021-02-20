import 'package:example/Geocoding/reverse_geocding.dart';
import 'package:example/StillMapImage/StillMapImage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MapMyIndia"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("Reverse Geocoding"),
                onPressed: () {
                  // https://github.com/nikhiladmin/mapmyindia-flutter/blob/master/example/lib/Geocoding/reverse_geocding.dart
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ReverseGeocoding()));
                }),
            RaisedButton(
                child: Text("Still Map Image"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => StillMapImage()));
                }),
          ],
        ),
      ),
    );
  }
}
