import 'package:flutter/material.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/menus/app_menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<void> _onSubmitBtnPressed() async {
    final request = context.watch<CookieRequest>();
    print(_username);
    print(_password1);
    // 'username' and 'password' should be the values of the user login form.
    final response = await request.login("$apiUrl/auth/login", {
      'username': _username,
      'password': _password1,
    });
    if (request.loggedIn) {
      print("Success Login");
    } else {
      print("Gagal login");
    }
  }

  String _username = "";
  String _password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      drawer: const AppMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Login"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (e) {
                        setState(() {
                          _username = e;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username tidak boleh kosong!";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (e) {
                        setState(() {
                          _password1 = e;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong!";
                        }
                      },
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: _onSubmitBtnPressed, child: const Text("Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}