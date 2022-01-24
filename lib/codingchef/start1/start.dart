import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Start1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Title",
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Text'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('Hello1'),
            Text('Hello2'),
            Text('Hello3'),
          ],
        ),
      ),
    );
  }
}
