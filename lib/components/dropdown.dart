import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String? selectedState;
  final ValueChanged<String?>? onChanged;
  final List<String> rooms;

  DropDown({
    required this.selectedState,
    required this.onChanged,
    required this.rooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 170,
      child: DropdownButtonFormField<String>(
        value: selectedState,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        onChanged: onChanged,
        items: rooms.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                SizedBox(width: 15,),
                Text(value)
              ],),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }
}