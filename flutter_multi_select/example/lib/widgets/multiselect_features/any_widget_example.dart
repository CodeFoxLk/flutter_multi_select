import 'package:flutter/material.dart';
import 'package:flutter_multi_selects/flutter_multi_select.dart';

class AnyWidgetExample extends StatelessWidget {
  const AnyWidgetExample({
    Key? key,
  }) : super(key: key);

  Widget getChild(String imagePath, String title) {
    return SizedBox(
      width: 75,
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Image.network(
            imagePath,
            fit: BoxFit.contain,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
      itemsPadding: const EdgeInsets.all(5),
      itemsDecoration: MultiSelectDecorations(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.1)
        ),
        selectedDecoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
             Colors.green,
             Colors.lightGreen
          ]),  
          
        ),
      ),
      items: [
      MultiSelectCard(
        value: 'Dart',
        child: getChild(
            'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
            'Dart'),
      ),
      MultiSelectCard(
        value: 'Python',
        child: getChild(
            'http://assets.stickpng.com/images/5848152fcef1014c0b5e4967.png',
            'Python'),
      ),
      MultiSelectCard(
          value: 'JavaScript',
          child: getChild(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png',
              'JavaScript')),
      MultiSelectCard(
        value: 'Java',
        child: getChild(
            'http://assets.stickpng.com/images/58480979cef1014c0b5e4901.png',
            'Java'),
      ),
      MultiSelectCard(
        value: 'C#',
        child: getChild(
            'https://seeklogo.com/images/C/c-sharp-c-logo-02F17714BA-seeklogo.com.png',
            'C#'),
      ),
      MultiSelectCard(
        value: 'C++',
        child: getChild(
            'https://cdn.freebiesupply.com/logos/thumbs/2x/c-logo.png',
            'C++'),
      ),
      MultiSelectCard(
        value: 'Go Lang',
        child: getChild(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1200px-Go_Logo_Blue.svg.png',
            'Go Lang'),
      ),
      MultiSelectCard(
        value: 'Swift',
        child: getChild(
            'https://d2908q01vomqb2.cloudfront.net/0716d9708d321ffb6a00818614779e779925365c/2021/08/26/swift.png',
            'Swift'),
      ),
      MultiSelectCard(
        value: 'PHP',
        child: getChild(
            'http://assets.stickpng.com/images/58481791cef1014c0b5e4994.png',
            'PHP'),
      ),
      MultiSelectCard(
        value: 'Kotlin',
        child: getChild(
            'https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png',
            'Kotlin'),
      )
    ], onChange: (allSelectedItems, selectedItem) {});
  }
}
