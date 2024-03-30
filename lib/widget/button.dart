import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  required Color? bgColor,
  required Color? bgColorText,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text( text, style: TextStyle(
              color: bgColorText))
      ),
    ),
  );
}