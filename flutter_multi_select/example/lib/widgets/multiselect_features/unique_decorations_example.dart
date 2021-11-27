import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class UniqueDecorationsExample extends StatelessWidget {
  const UniqueDecorationsExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelectContainer(
        prefix: MultiSelectPrefix(
          selectedPrefix: const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
        items: [
          MultiSelectCard(
            value: 'Dart',
            label: 'Dart',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'Python',
            label: 'Python',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'JavaScript',
            label: 'JavaScript',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'Java',
            label: 'Java',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'C#',
            label: 'C#',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'C++',
            label: 'C++',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          MultiSelectCard(
            value: 'Kotlin',
            label: 'Kotlin',
            decorations: MultiSelectItemDecorations(
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ],
        onChange: (allSelectedItems, selectedItem) {});
  }
}