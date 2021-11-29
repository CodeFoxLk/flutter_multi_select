import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
