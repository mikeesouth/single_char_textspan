import 'package:flutter/material.dart';
import 'package:single_char_textspan/fruit_colorizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final _controller1 = FruitColorizer({
    'apple': TextStyle(color: Colors.green),
    'orange': TextStyle(color: Colors.orange),
  });
  final _controller2 = FruitColorizer({
    'apple': TextStyle(color: Colors.green),
    'orange': TextStyle(color: Colors.orange),
  });
  final _controller3 = FruitColorizer({
    'apple': TextStyle(color: Colors.green),
    'orange': TextStyle(color: Colors.orange),
  });

  @override
  void initState() {
    _controller1.text = 'I wanted an apple but got an orange.';
    _controller2.text = 'apple orange <-- cursor bugs at space';
    _controller3.text = 'apple  orange <-- double space = no bug';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cursor bugs when a text span is a single character (in this case a space). ' +
                  'Try to put the cursor right before the "o" in "orange" in the middle text ' +
                  'field. Also, try to drag the cursor using the selection handle from right ' +
                  'to left over the single space text span, notice that it "jumps" at the ' +
                  'space in the middle text field.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontSize: 20),
              controller: _controller1,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              controller: _controller2,
            ),
            TextField(
              style: TextStyle(fontSize: 20),
              controller: _controller3,
            ),
          ],
        ),
      ),
    );
  }
}
