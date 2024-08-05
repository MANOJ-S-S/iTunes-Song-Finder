
import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class ParameterSelectionChip extends StatefulWidget {

  final bool isSelected;
  final String title;
  final Function(bool isSelected)? selectFunction;
  final Function()? deleteFunction;

  const ParameterSelectionChip({super.key, this.isSelected = false, required this.title, this.selectFunction, this.deleteFunction });

  @override
  State<ParameterSelectionChip> createState() => _ParameterSelectionChipState();
}

class _ParameterSelectionChipState extends State<ParameterSelectionChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(15), right: Radius.circular(15)),
      ),
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      label: Text(widget.title),
      elevation:  widget.isSelected? 50: 0,
      labelStyle:
      TextStyle(fontWeight: FontWeight.normal, color:  Colors.black38,
          fontSize: SizeConfig.size16,
      height: 1.2),
      backgroundColor: Colors.white38,
      deleteIcon: const Icon(Icons.dangerous),
      deleteIconColor: Colors.redAccent,
      onDeleted: () => {
        widget.deleteFunction!()
      },
      onSelected: (bool value) => {
      },
    );
  }
}
