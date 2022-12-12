import 'dart:async';
import 'package:online_pharmacy/menus/app_menu.dart';
import 'package:online_pharmacy/models/medicine.dart';
import 'package:online_pharmacy/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  List<Medicine> medicines = [];
  String query = '';
  Future<List<Medicine>> getMedicines(String query) async {
    final url = Uri.parse(
        'https://pbp-b01-proyek-tengah-semester.herokuapp.com/medicine/retrieve');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List medicine = json.decode(response.body);

      return medicine.map((json) => Medicine.fromJson(json)).where((medicine) {
        final nameLower = medicine.name.toLowerCase();
        final pharmacyLower = medicine.pharmacy.toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) ||
            pharmacyLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final medicine = await getMedicines(query);

    setState(() => medicines = medicine);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Online Pharma Market'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            FutureBuilder(
                future: getMedicines(query),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return const Text(
                        "There is no medicine available for now, check again later!",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      );
                    } else {
                      return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 2.0)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data![index].name}",
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                            "Stock: ${snapshot.data![index].stock}"),
                                        Text(
                                          "Pharmacy: ${snapshot.data![index].pharmacy}",
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )));
                    }
                  }
                }),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Medicine or Pharmacy Name',
        onChanged: searchMedicine,
      );

  Future searchMedicine(String query) async {
    final medicines = await getMedicines(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.medicines = medicines;
    });
  }
}
