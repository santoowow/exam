import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

Future fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://csrng.net/csrng/csrng.php?min=1&max=1000'));

  if (response.statusCode == 200) {

    var resp = jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}


void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  int _randomNumber = 0;
  Random random = Random();
  Random random2 = Random.secure();

  void _generateRandomNumberInRange() {
    var min = 1;
    var max = 1000;
    setState(() {
      _randomNumber = min + random.nextInt(max - min);

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random number generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_randomNumber',
                style: style,
              ),
              ElevatedButton(
                onPressed: _generateRandomNumberInRange,
                child: const Text('Generate Random number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}