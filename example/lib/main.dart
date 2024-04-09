import 'package:flutter/material.dart';

import 'package:login_plugin/login_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormLogin(),
    );
  }
}

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _login(String email, String password) async {
    try {
      await LoginPlugin().login(email, password);
    } catch (e) {
      print('Error calculating sum: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: const Text(
                  'Đăng Nhập',
                  style: TextStyle(
                    color: Color(0xFF2E9BFF),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(
                      color: Color(0xFF028DFD),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Color(0xFF2E9BFF),
                    ),
                    focusColor: Color(0xFF2E9BFF),
                    labelText: 'Password',
                  ),
                ),
              ),
              // SizedBox(
              //   child: TextFieldWidget(),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                      String email = emailController.text;
                      String password = passwordController.text;
                      if (!email.isEmpty && !password.isEmpty) {
                        _login(email, password);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('yêu cầu nhập đủ thông tin '),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                      "Đăng Nhập",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
