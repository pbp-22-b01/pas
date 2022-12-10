import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/pharmacy/data_budget.dart';
import 'package:online_pharmacy/models/pharmacy.dart';
import 'package:online_pharmacy/api/pharmacy_api.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/models/medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';

class TambahBudgetPage extends StatefulWidget {
  const TambahBudgetPage({super.key, required this.refreshDataList});
  final void Function() refreshDataList;

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Pharmacy _newPharmacy = Pharmacy.fromUserInput();
  String _namaBudget = "";
  String _alamatBudget = "";
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚕️Create New Pharmacy!⚕️'),
      ),
      drawer: AdminMenu(),
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
                      _newPharmacy.name = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _newPharmacy.name = value!;
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
                      _newPharmacy.address = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _newPharmacy.address = value!;
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
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _onSubmitBtnPressed,
                    child: const Text("Simpan")),
              ),
              if (_isSubmitting) const Padding(
                padding: EdgeInsets.all(8.0),
                child: LinearProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onFormChange() {
    _formKey.currentState!.save();
  }
  Future<void> _onSubmitBtnPressed() async {
    if (_formKey.currentState!.validate()) {
      debugPrint('new pharmacy: $_newPharmacy');
      final request = Provider.of<CookieRequest>(context, listen: false);
      setState(() {
        _isSubmitting = true;
      });
      final Map<String, dynamic> response = await request.post("$apiUrl/pharmacy/create", _newPharmacy.toJson());
      setState(() {
        _isSubmitting = false;
      });
      final String message = response['message'];
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      if (response['status']) {
        _formKey.currentState!.reset();
        widget.refreshDataList();
      }
    }
  }

}