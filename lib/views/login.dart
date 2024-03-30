import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latihan_strukturdata_diflutter/views/home_teacher.dart';
import 'package:latihan_strukturdata_diflutter/views/register.dart';

// import 'package:latihan_strukturdata_diflutter/register.dart';
import 'package:latihan_strukturdata_diflutter/widget/button.dart';
import 'package:latihan_strukturdata_diflutter/widget/textField.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5399F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "Who are you ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: ClipOval(
                            child: SvgPicture.asset(
                              'assets/student.svg',
                              width: 150,
                            ),
                          ),
                        ),
                        buildButton(
                            text: "Student",
                            bgColor: Color(0xFFFFFFFF),
                            bgColorText: Color(0xFF5399F5),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterView()),
                              );
                            })
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: ClipOval(
                            child: SvgPicture.asset(
                              'assets/teacher.svg',
                              width: 150,
                            ),
                          ),
                        ),
                        buildButton(
                            text: "Teacher",
                            bgColor: Color(0xFFFFFFFF),
                            bgColorText: Color(0xFF5399F5),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeTeacher()),
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscureText = true;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

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
            height: 260,
            width: 250,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Login",
                      style: TextStyle(
                          color: Color(0xFF5399F5),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  buildTextField(
                      obscureText: false,
                      inputText: _username,
                      hintText: "Username"),
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
                  buildButton(
                      text: "Login",
                      bgColor: Color(0xFF5399F5),
                      bgColorText: Color(0XFFFFFFFF),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HighArrayExample()),
                        );
                      }),
                  buildButton(
                      text: "Register",
                      bgColor: Color(0xFF5399F5),
                      bgColorText: Color(0XFFFFFFFF),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HighArrayExample()),
                        );
                      })
                ]),
          ),
        ));
  }
}
