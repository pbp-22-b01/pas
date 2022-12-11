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
      appBar: AppBar(title: const Text("Detail Pharmacy"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(children: [
            Text(pharmacy.name, style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 20,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(children: [
                  TableRow(children: [
                    const Text("Alamat"),
                    Text(pharmacy.address),
                  ]),
                ],),
              ),
            )
          ],),
        ),
      ),
    );
  }
}