import 'package:flutter/material.dart';
import 'package:online_pharmacy/menus/customer_menu.dart';

import 'package:online_pharmacy/api/customer_api.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  // TODO: Nangkep dari page login dulu untuk username, nomor, dan alamat
  final Customer _update = Customer.fromUserInput();
  bool isLoading = false;
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  // String? username;
  // int? nomor;
  // String? alamat;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final customer = ModalRoute.of(context)!.settings.arguments as Customer;
    _phoneController.text = customer.phone;
    _addressController.text = customer.address;
    _firstController.text = customer.firstname;
    _lastController.text = customer.lastname;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer: const CustomerMenu(),
      
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
                    controller: _firstController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.chat_bubble_rounded),
                      hintText: "First Name",
                      labelText: "First Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _lastController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.chat_bubble_rounded),
                      hintText: "Last Name",
                      labelText: "Last Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                   
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _addressController,
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
                    
                  ),),

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
                              if (_formKey.currentState!.validate()) {

                                final response = await request.post("$apiUrl/customer/profile/edit", {
                                 
                                  "first_name": _firstController.text,
                                  "last_name": _lastController.text,
                                  "address":_addressController.text,
                                  "phone":_phoneController.text,
                                });
                                  if (!mounted) return;

                              final snackBar = SnackBar(content: Text(response["message"]));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              if(response["status"]){
                                Navigator.pushReplacementNamed(context, "/customer/home");
                               }
                              
                            

                              setState(() {
                                isLoading = false;
                             
                              });

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
                        Container(
                          width: 125,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed("/customer/home");
                            },
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
