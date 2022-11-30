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
  bool isLoading = false;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<void> _onSubmitBtnPressed(
      CookieRequest request, ScaffoldMessengerState scaffoldMessenger) async {
    setState(() {
      isLoading = true;
    });
    // 'username' and 'password' should be the values of the user login form.
    final response = await request.login("$apiUrl/accounts/login/", {
      'username': _username,
      'password': _password1,
    });
    if (request.loggedIn) {
      print("Success Login");
      const snackBar = SnackBar(content: Text("Berhasil login!"));
      scaffoldMessenger.showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(content: Text(response["errors"]));
      scaffoldMessenger.showSnackBar(snackBar);
    }
    setState(() {
      isLoading = false;
    });
  }

  String _username = "";
  String _password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                      onPressed: isLoading ?  null : () =>
                          _onSubmitBtnPressed(request, scaffoldMessenger),
                      child: const Text("Login")),
                  const SizedBox(height: 30,),
                  if (isLoading) const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
