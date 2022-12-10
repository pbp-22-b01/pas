import 'package:online_pharmacy/pages/pharmacy/pharmacy_detail.dart';
import 'package:online_pharmacy/pages/pharmacy/tambah_budget.dart';
import 'package:flutter/material.dart';
//import 'package:online_pharmacy/pages/drawer.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';
import 'package:online_pharmacy/config/fetch_pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/api/pharmacy_api.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';
import 'package:online_pharmacy/pages/pharmacy/pharmacy_detail.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../models/pharmacy.dart';

class PharmacyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  late Future<List<Pharmacy>> _dataList;

  @override
  void initState() {
    super.initState();
    final request = Provider.of<CookieRequest>(context, listen: false);
    _dataList = fetchPharmacy();
  }

  void refresh() {
    final request = Provider.of<CookieRequest>(context, listen: false);
    setState(() {
      _dataList = fetchPharmacy();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⚕️Data Pharmacy⚕️"),
      ),
      drawer: const AdminMenu(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TambahBudgetPage(refreshDataList: () => refresh())));
      },
      child: const Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Pharmacy>>(
            future: _dataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PharmacyListView(dataList: snapshot.data!);
              }
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class PharmacyListView extends StatelessWidget {
  final List<Pharmacy> dataList;

  const PharmacyListView({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(dataList[index].name),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PharmacyDetail(pharmacy: dataList[index]))),
              ),
            ));
  }
}
