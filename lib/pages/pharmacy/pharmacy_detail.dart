import 'package:flutter/material.dart';
//import 'package:online_pharmacy/pages/drawer.dart';
import 'package:online_pharmacy/models/pharmacy.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';

class PharmacyDetail extends StatelessWidget{
  final Pharmacy pharmacy;
  const PharmacyDetail({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy'),
      ),
      drawer: AdminMenu(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(children: [
          Center(
            child: Text(
              pharmacy.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ),
          const SizedBox(height: 10,),

          Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Alamat: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    pharmacy.address,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
            ]
          ),

          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      )
    );
  }
}