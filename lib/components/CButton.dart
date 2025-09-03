import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String myText;
  final Color myTextColor;
  final VoidCallback onPressed;

  const CButton({
    super.key,
    required this.myText,
    required this.myTextColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(myText, style: TextStyle(color: myTextColor)),
    );
  }
}
