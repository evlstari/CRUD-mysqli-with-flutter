import 'package:flutter/material.dart';

enum TextFieldType { TextField, Container }
typedef void DropdownCallback(String? newValue);

Widget buildTextField(
    {TextFieldType textFieldType = TextFieldType.TextField,
    TextEditingController? inputText,
    String? hintText,
    Widget? suffixIcon,
    VoidCallback? onPressed,
      DropdownCallback? onChanged,
    bool? obscureText = true,
    String? hinttextOption,
    Color? colorTextOption,
    List<DropdownMenuItem<String>>? items}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: textFieldType == TextFieldType.TextField
          ? TextField(
              obscureText: obscureText!,
              controller: inputText!,
              decoration: InputDecoration(
                  hintText: hintText!,
                  hintStyle: TextStyle(color: Color(0x905399F5)),
                  fillColor: Color(0x205399F5),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: suffixIcon,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10)),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0x205399F5),
              ),
              child: DropdownButton<String>(
                hint: Text(
                  hinttextOption ?? 'Status',
                  style: TextStyle(color: Color(0x905399F5)),
                ),
                onChanged: onChanged,
                items: items ?? [],
                isExpanded: true,
                underline: SizedBox(),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
              ),
            ));
}
