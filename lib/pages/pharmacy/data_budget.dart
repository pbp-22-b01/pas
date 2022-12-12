import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/pharmacy/tambah_budget.dart';
//import 'package:online_pharmacy/pages/drawer.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';

class DataBudgetPage extends StatelessWidget {
  const DataBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = '⚕️Data Pharmacy⚕️';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
         drawer: AdminMenu(),
        body: SingleChildScrollView(
         child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: TambahBudgetPage.daftar_budget.map((DataBudget o) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            o.nama,
                            style: const TextStyle(fontSize: 22.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            o.alamat.toString(),
                            style: const TextStyle(fontSize: 14.0),
                          ),                          
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
         ),
        ),
      ),
    );
  }
}