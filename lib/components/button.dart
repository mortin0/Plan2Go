import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final String myText;
  final void Function()? event;
  const SwitchButton({
    super.key,
    required this.myText,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(2.4),
        decoration: BoxDecoration(
          color: Colors.green,
          //borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
