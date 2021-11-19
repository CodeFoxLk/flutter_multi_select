import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SimpleMultiSelectContainer(
          maxSelectingCount: 2,
          items: [
            SimpleMultiSelectCard(label: 'Acura', value: 'Acura'),
            SimpleMultiSelectCard(label: 'Alfa Romeo', value: 'Alfa Romeo'),
            SimpleMultiSelectCard(label: 'BMW', value: 'BMW'),
            SimpleMultiSelectCard(label: 'Bentley', value: 'Bentley'),
            SimpleMultiSelectCard(label: 'Buick', value: 'Buick'),
            SimpleMultiSelectCard(label: 'Cadillaco', value: 'Cadillac'),
            SimpleMultiSelectCard(label: 'Chevrolet', value: 'Chevrolet'),
            SimpleMultiSelectCard(label: 'Jaguar', value: 'Jaguar')
          ],
          onChange: (v, a) {
            
          },
        ),
      ),
    );
  }
}
