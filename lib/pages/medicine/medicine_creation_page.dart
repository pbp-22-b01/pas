import 'package:online_pharmacy/api/pharmacy_api.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/models/medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../models/pharmacy.dart';

class MedicineCreationPage extends StatefulWidget {
  const MedicineCreationPage({super.key});

  @override
  State<StatefulWidget> createState() => _MedicineCreationPageState();
}

class _MedicineCreationPageState extends State<MedicineCreationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _formChanged = false;
  final Medicine _newMedicine = Medicine.fromUserInput();
  bool _isLoadingData = false;
  bool _isSubmitting = false;
  late Future<List<Pharmacy>> _pharmacyList;

  @override
  void initState() {
    super.initState();
    final request = Provider.of<CookieRequest>(context, listen: false);
    _isLoadingData = true;
    _pharmacyList = fetchPharmacyList(request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Obat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Pharmacy>>(future: _pharmacyList, builder:
            (BuildContext context, AsyncSnapshot<List<Pharmacy>> snapshot) {
          if (snapshot.hasData) {
            return Form(
                key: _formKey,
                onChanged: _onFormChange,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Nama Obat",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (e) {
                          setState(() {
                            _newMedicine.name = e!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama obat tidak boleh kosong!";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Stok",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (String? val) {
                          setState(() {
                            if (val!.isNotEmpty) {
                              _newMedicine.stock = int.parse(val);
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Stok harus diisi!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<Pharmacy>(
                        items: snapshot.data!.map<DropdownMenuItem<Pharmacy>>(
                            (Pharmacy pharmacy) {
                          return DropdownMenuItem<Pharmacy>(
                              value: pharmacy, child: Text(pharmacy.name));
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: "Apotek",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (e) {
                          setState(() {
                            if (e != null) {
                              _newMedicine.pharmacy = "${e.id}";
                            }
                          });
                        },
                        onChanged: (e) => setState(() {
                          if (e != null) {
                            _newMedicine.pharmacy = "${e.id}";
                          }
                        }),
                        validator: (e) {
                          if (e == null) {
                            return "Apotek harus diisi!";
                          }
                          return null;
                        },
                      ),
                    ),
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
                ));
          }
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  void _onFormChange() {
    _formKey.currentState!.save();
  }

  Future<void> _onSubmitBtnPressed() async {
    if (_formKey.currentState!.validate()) {
      debugPrint('new medicine: $_newMedicine');
      final request = Provider.of<CookieRequest>(context, listen: false);
      setState(() {
        _isSubmitting = true;
      });
      final Map<String, dynamic> response = await request.post("$apiUrl/medicine/create", _newMedicine.toJson());
      setState(() {
        _isSubmitting = false;
      });
      final String message = response['message'];
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      if (response['status']) {
        _formKey.currentState!.reset();
      }
    }
  }
}
