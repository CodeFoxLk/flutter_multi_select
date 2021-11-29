import 'package:example/themedata/textstyles.dart';
import 'package:example/widgets/examples.dart';
import 'package:flutter/material.dart';

class ChipExamplesScreen extends StatelessWidget {
  const ChipExamplesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      height: 40,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Multi Select Chip Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'Outlined chips',
                style: titleTS,
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedChipsExample(),
              divider,
              Text(
                'Basic chips',
                style: titleTS,
              ),
              SizedBox(
                height: 10,
              ),
              BasicChipsExample(),
              divider,
              Text(
                'Colorful chips',
                style: titleTS,
              ),
              SizedBox(
                height: 10,
              ),
              ColorFulChipExample(),
              divider,
              Text(
                'Icon chips',
                style: titleTS,
              ),
              SizedBox(
                height: 10,
              ),
              IconsChipsExample(),
            ],
          ),
        ),
      ),
    );
  }
}
