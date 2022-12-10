import 'package:flutter/material.dart';
import 'package:online_pharmacy/models/medicine.dart';

class MedicineDetailPage extends StatelessWidget {
  final Medicine medicine;
  const MedicineDetailPage({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Obat"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
            Text(medicine.name, style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 20,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(children: [
                  TableRow(children: [
                    const Text("Stok"),
                    Text("${medicine.stock}"),
                  ]),
                  TableRow(children: [
                    const Text("Pharmacy"),
                    Text(medicine.pharmacy),
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