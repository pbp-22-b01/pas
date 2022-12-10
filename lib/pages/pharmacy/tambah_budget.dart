import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/pharmacy/data_budget.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';

class TambahBudgetPage extends StatefulWidget {
  const TambahBudgetPage({super.key});

  //simpan data budget dalam list daftar_budget
  static List<DataBudget> daftar_budget = [];

  static void add({
    required nama,
    required alamat,
  }) {
    //simpan variabel dalam daftar_budget
    daftar_budget.add(
        DataBudget(nama: nama, alamat: alamat));
  }

  @override
  State<TambahBudgetPage> createState() => _TambahBudgetPageState();
}

//DataBudget
class DataBudget {
  String nama;
  String alamat;

  DataBudget({
    required this.nama,
    required this.alamat,
  });
}

class _TambahBudgetPageState extends State<TambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaBudget = "";
  String _alamatBudget = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚕️Create New Pharmacy!⚕️'),
      ),
      drawer: const AdminMenu(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

            //1. nama
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Pfizer Inc.",
                    labelText: "Nama",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _namaBudget = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _namaBudget = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

            //2. alamat
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh:  Brooklyn, Kota New York, New York, Amerika",
                    labelText: "Alamat",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _alamatBudget = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _alamatBudget = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'alamat tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              
              Expanded(child: Container()),

              //5.Simpan
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),

                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TambahBudgetPage.add(
                              nama: _namaBudget,
                              alamat: _alamatBudget);
                        }
                        _formKey.currentState!.reset();
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}