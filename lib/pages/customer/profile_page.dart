import 'package:flutter/material.dart';
import 'package:online_pharmacy/menus/app_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  // TODO: Nangkep dari page login dulu untuk username, nomor, dan alamat
  String? username;
  int? nomor;
  String? alamat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer: const AppMenu(),
      // TODO: Hidden profile klo blm login. Ternary..
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
                    decoration: InputDecoration(
                      hintText: "Example: Yohan",
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 081212345678",
                      labelText: "Telepon",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nomor = int.tryParse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nomor = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor telepon tidak boleh kosong!';
                      } else if (nomor == null) {
                        return 'Nomor telepon harus berisi angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Jl. Pegangsaan Timur no 56",
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        alamat = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        alamat = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat tidak boleh kosong!';
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
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO: Update the profile

                              setState(() {
                                // TODO: Reset
                              });

                              Navigator.of(context).pushReplacementNamed("/");
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        child: const Text(""),
                      ),
                      Container(
                        width: 125,
                        child: TextButton(
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/");
                          },
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
