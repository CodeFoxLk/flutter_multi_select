import 'package:example/widgets/examples.dart';
import 'package:flutter/material.dart';

class CheckListExampleDesignsScreen extends StatelessWidget {
  const CheckListExampleDesignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Colorful Check List'),
        ),
        body: ColorfulCheckList());
  }
}
