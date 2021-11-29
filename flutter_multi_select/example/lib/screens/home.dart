import 'package:flutter/material.dart';

import 'check_list_example_designs.dart';
import 'chips_example_designs_screen.dart';
import 'multiselect_check_list.dart';
import 'multiselect_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FLUTTER MULTI SELECT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const SimpleMultiSelectSceen()));
                    },
                    child: const Text('Simple multi select items')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiSelectCheckListScreen()));
                    },
                    child: const Text('Multi select check list')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChipExamplesScreen()));
                    },
                    child: const Text('Multi select chip designs')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const CheckListExampleDesignsScreen()));
                    },
                    child: const Text('Multi select check list designs')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
