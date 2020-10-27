import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Current time',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Current time'),
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
  String _dateTime = 'Current time';

  void _getDateTime() {
    setState(() {
      String _date = DateTime.now().toString().substring(0, 10);
      String _time = DateTime.now().toString().substring(11, 19);
      _dateTime = 'Date: ' + _date + '\n' + 'Time: ' + _time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Press button to refresh',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                '$_dateTime',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDateTime,
        tooltip: 'Time',
        child: Icon(Icons.refresh),
      ),
    );
  }
}