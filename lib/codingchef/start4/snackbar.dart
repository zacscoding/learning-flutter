import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
        centerTitle: true,
      ),
      // body: createBody(context),
      body: MySnackBar(),
    );
  }
}

Widget createBody(BuildContext context) {
  return Builder(
    builder: (BuildContext ctx) {
      return Center(
          child: OutlinedButton(
        child: Text(
          'Show me',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Hello')));
        },
      ));
    },
  );
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Show me'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Hello',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(microseconds: 1500),
          ));
        },
      ),
    );
  }
}
