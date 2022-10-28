import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TagForm extends StatefulWidget {
  const TagForm({super.key, required this.chipName});
  final String chipName;

  @override
  State<TagForm> createState() => _TagFormState();
}

class _TagFormState extends State<TagForm> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // 'What is the main reason that you this packaging  is marketed towards kids?'
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: const StadiumBorder(side: BorderSide()),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          print(_isSelected);
        });
      },
      selectedColor: const Color.fromRGBO(235, 235, 235, 1),
      showCheckmark: false,
    );
  }
}
