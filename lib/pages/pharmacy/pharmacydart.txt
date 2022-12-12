import 'package:online_pharmacy/pages/pharmacy/pharmacy_detail.dart';
import 'package:flutter/material.dart';
//import 'package:online_pharmacy/pages/drawer.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';
import 'package:online_pharmacy/config/fetch_pharmacy.dart';

class PharmacyPage extends StatefulWidget{
  const PharmacyPage({super.key});

  State<PharmacyPage> createState() => _PharmacyPage();
}

class _PharmacyPage extends State<PharmacyPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy'),
      ),
      drawer: AdminMenu(),

      body: FutureBuilder(
          future: fetchPharmacy(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }else{
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Data Kosong",
                      style: TextStyle(fontSize: 20),
                      ),
                  ],
                );
              } else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                         
                      ),

                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                        child: ListTile(
                          title: Text(
                            "${snapshot.data![index].name}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          ),

                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  PharmacyDetail(
                                    pharmacy: snapshot.data![index],
                                  )
                              ),
                            );
                          }
                        ),
                      ),
                    )
                  ),
                );
              }
            }
          }
      )
    );
  }
}