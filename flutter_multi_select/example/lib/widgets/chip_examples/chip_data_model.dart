import 'package:flutter/material.dart';

class ChipData {
  final Color chipColor;
  final String value;
  final String label;
  final IconData icon;

  const ChipData(
      {required this.chipColor,
      required this.value,
      required this.label,
      required this.icon});

  static List<ChipData> getChips() => const <ChipData>[
        ChipData(
            chipColor: Color.fromARGB(255, 107, 163, 195),
            label: 'Dart',
            value: 'Dart',
            icon: Icons.connected_tv_sharp),
        ChipData(
            chipColor: Color.fromARGB(255, 218, 56, 106),
            label: 'Python',
            value: 'Python',
            icon: Icons.control_camera_sharp),
        ChipData(
            chipColor: Color.fromARGB(255, 168, 66, 68),
            label: 'JavaScript',
            value: 'JavaScript',
            icon: Icons.cottage_rounded),
        ChipData(
            chipColor: Color.fromARGB(255, 255, 181, 130),
            label: 'Java',
            value: 'Java',
            icon: Icons.crop_original_rounded),
        ChipData(
            chipColor: Color.fromARGB(255, 232, 117, 90),
            label: 'C#',
            value: 'C#',
            icon: Icons.dashboard_rounded),
        ChipData(
            chipColor: Color.fromARGB(255, 78, 140, 155),
            label: 'C++',
            value: 'C++',
            icon: Icons.delivery_dining_rounded),
        ChipData(
            chipColor: Color.fromARGB(255, 117, 81, 133),
            label: 'Go Lang',
            value: 'Go Lang',
            icon: Icons.developer_board_sharp),
        ChipData(
            chipColor: Color.fromARGB(255, 187, 32, 60),
            label: 'Swift',
            value: 'Swift',
            icon: Icons.devices_other_sharp),
        ChipData(
            chipColor: Color.fromARGB(255, 222, 62, 37),
            label: 'Visual Basic',
            value: 'Visual Basic',
            icon: Icons.dinner_dining_outlined),
        ChipData(
            chipColor: Color.fromARGB(255, 74, 176, 151),
            label: 'solidity',
            value: 'solidity',
            icon: Icons.double_arrow_outlined),
      ];
}
