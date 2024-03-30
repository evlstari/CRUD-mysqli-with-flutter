import 'package:flutter/material.dart';
import 'package:latihan_strukturdata_diflutter/logic/datamhs.dart';
import 'package:latihan_strukturdata_diflutter/main.dart';
import 'package:latihan_strukturdata_diflutter/widget/button.dart';
import 'package:latihan_strukturdata_diflutter/widget/textField.dart';

import 'home.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  final List<String> options = ['Student', 'Teacher'];
  bool isObscureText = true;
  String? selectedOption;

  TextEditingController? _username;
  TextEditingController? _email;
  TextEditingController? _pwd;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _email = TextEditingController();
    _pwd = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF5399F5),
        body: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              height: 350,
              width: 250,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Register",
                        style: TextStyle(
                            color: Color(0xFF5399F5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    buildTextField(inputText: _username!, hintText: "Username"),
                    buildTextField(
                      textFieldType: TextFieldType.Container,
                      hinttextOption: selectedOption,
                      onChanged: (String? newValue) {
                        print('Selected option: $newValue');
                        setState(() {
                          selectedOption = newValue;
                        });
                      },
                      items: options.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    buildTextField(inputText: _email, hintText: "Email"),
                    buildTextField(
                        obscureText: isObscureText,
                        inputText: _pwd,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                    buildButton(text: "Register",
                        bgColor: Color(0xFF5399F5),
                        bgColorText: Color(0XFFFFFFFF),
                        onPressed:(){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HighArrayExample()),
                          );
                        }
                    )

                  ]),
            )));
  }
}
