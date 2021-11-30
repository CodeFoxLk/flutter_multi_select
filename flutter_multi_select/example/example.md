## All **examples** are available  [in this example flutter project](https://github.com/CodeFoxLk/flutter_multi_select/tree/master/flutter_multi_select/example "All multi select examples")

#### Minimum Setup

<img src="https://i.ibb.co/HBfwZYH/minimum-setup.gif" alt="flutter multi select minimum-setup" border="0">

    MultiSelectContainer(items: [
          MultiSelectCard(value: 'Dart', label: 'Dart'),
          MultiSelectCard(value: 'Python', label: 'Python'),
          MultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
          MultiSelectCard(value: 'Java', label: 'Java'),
          MultiSelectCard(value: 'C#', label: 'C#'),
          MultiSelectCard(value: 'C++', label: 'C++'),
          MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
          MultiSelectCard(value: 'Swift', label: 'Swift'),
          MultiSelectCard(value: 'PHP', label: 'PHP'),
          MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
        ], onChange: (allSelectedItems, selectedItem) {})