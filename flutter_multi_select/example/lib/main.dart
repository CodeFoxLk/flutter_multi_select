import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

import 'screens/simple_sultiselecr_screen.dart';

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
      home: SimpleMultiSelectSceen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final MultiSelectController<String> _controller =  MultiSelectController();
  final TextEditingController _tse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdvanceMultiSelectContainer(items: [
      AdvanceMultiSelectCard(
          value: 'A',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          selectedChild: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          )),
      AdvanceMultiSelectCard(
          value: 'A',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          selectedChild: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          )),
    ], onChange: (v, v1) {})

        //     Center(
        //         child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextField(
        //       controller: _tse,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           _controller.unSelectAll();
        //         },
        //         child: const Text('Clear all')),
        //     ElevatedButton(
        //         onPressed: () {

        //         },
        //         child: const Text('get selected all')),
        //     MultiSelectCheckList(
        //       itemsDecoration: const MultiSelectDecorations(),
        //       controller: _controller,
        //       items: [
        //         CheckListCard(
        //             leadingCheckBox: false,
        //             freezeInSelected: true,
        //             value: 'Hiii',
        //             title: const Text('BMW'),
        //             subtitle: const Text(
        //               'BMW Best car, The Best car, The Best car, The Best car, The Best car, The Best car, The Best car, The Best car,',
        //             )),
        //         CheckListCard(value: 'Hiii', title: const Text('Benz')),
        //         CheckListCard(
        //           value: 'Hiii',
        //           title: const Text('Toyota'),
        //           enabled: false,
        //         )
        //       ],
        //       onChange: (v, i) {},
        //     )
        //   ],
        // ))

        // SimpleMultiSelectContainer(
        //   showInListView: true,
        //   wrapSettings: const WrapSettings(direction: Axis.horizontal),
        //   listViewSettings:  ListViewSettings(
        //     separatorBuilder: (c , i){
        //       return const SizedBox(height: 20,);
        //     }
        //   ),
        //   // prefix: MultiSelectPrefix(
        //   //     selectedPrefix: const Padding(
        //   //   padding: EdgeInsets.only(right: 5),
        //   //   child: Icon(
        //   //     Icons.check,
        //   //     color: Colors.white,
        //   //     size: 14,
        //   //   ),
        //   // )),
        //   items: [

        //     SimpleMultiSelectCard(label: 'Acura', value: 'Acura'),
        //     SimpleMultiSelectCard(label: 'Alfa Romeo', value: 'Alfa Romeo', enabled: false),
        //     SimpleMultiSelectCard(label: 'BMW', value: 'BMW'),
        //     SimpleMultiSelectCard(
        //         label: 'Bentley', value: 'Bentley', freezeInSelected: true),
        //     SimpleMultiSelectCard(
        //       selected: true,
        //       label: 'Buick',
        //       value: 'Buick',
        //     ),
        //     SimpleMultiSelectCard(label: 'Cadillaco', value: 'Cadillac'),
        //     SimpleMultiSelectCard(label: 'Chevrolet', value: 'Chevrolet'),
        //     SimpleMultiSelectCard(label: 'Jaguar', value: 'Jaguar')
        //   ],
        //   onChange: (v, i) {
        //     print(i);
        //   },
        // ),

        );
  }
}
