import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_pharmacy/menus/app_menu.dart';
import 'package:online_pharmacy/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:online_pharmacy/config/app_config.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
   bool isLoading = false;
  // TODO: Nangkep dari page login dulu untuk username, nomor, dan alamat
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

@override
  void dispose(){
  _usernameController.dispose();
  _passwordController.dispose();
  _phoneController.dispose();
  _addressController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form"),
      ),
      drawer: const AppMenu(),
      
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: "Choose a username",
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please fill out the username!";
                      }
                      else if(value.length>150){
                        return "Require 150 characters or fewer";
                      }
                     
                      else if(value.contains(RegExp(r'[^a-zA-Z0-9@.+-_]'))  ){
                        return "Require letters, digits and @/./+/-/_ only.";
                      }
                      
                      return null;
                    },
                    
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true, //hide pass
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: "Password",
                      labelText: "Password",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Your password must contain at least 8 characters.';
                      }
                      else if(value.contains(RegExp(r'^[0-9]+$'))){
                        return 'Your password can’t be entirely numeric.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true, //hide pass
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      } else if (value.length < 8) {
                        return 'Your password must contain at least 8 characters.';
                      }
                      else if (value != _passwordController.text){
                        return "Password invalid!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.home),
                      hintText: "Example: Jl. Pegangsaan Timur no 56",
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Address cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                    decoration: InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: "Contoh: 081212345678",
                      labelText: "Telepon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value){
                    
                     
                      if(value==null||value.isEmpty){
                        return "Please fill out the phone number!";
                      }
                      else if(value.length!=12){
                        return "Please fill out the valid length of 12 number";
                      }
                      
                      return null;
                    },
                    
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () async {
                             setState(() {
                                isLoading = true;
                              });
                            if (_formKey.currentState!.validate()) {
                              final response = await request.post("$apiUrl/customer/register/", {
                                "username" : _usernameController.text,
                                "password" : _passwordController.text,
                                "first_name": "",
                                "last_name": "",
                                "address":_addressController.text,
                                "phone":_phoneController.text,
                               
                              
                                
                                }
                              );
                              if (!mounted) return;

                              final snackBar = SnackBar(content: Text(response.message));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              if(response.status){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()),
                               );
                               }
                              
                            

                              setState(() {
                               isLoading = false;
                             
                              });
                              

                              Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: const Text(""),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
