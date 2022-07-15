import 'package:flutter/material.dart';
import 'package:jwtson/jwtson.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _jwtsonPlugin = Jwtson();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Jwtson example app'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                // generate and sign jwt token
                var token = await _jwtsonPlugin
                    .generateToken(key: "secret", body: {"key": "body"}, header: {"key": "header"});
                print(token);
                // decode jwt token
                var decode = await _jwtsonPlugin.decodeJwtToken(key: "secret", tokenJwt: token);
                print(decode?.toJson());
              },
              child: const Text('click me')),
        ),
      ),
    );
  }
}
