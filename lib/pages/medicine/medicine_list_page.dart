import 'package:flutter/material.dart';
import 'package:online_pharmacy/api/medicine_api.dart';
import 'package:online_pharmacy/config/app_config.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';
import 'package:online_pharmacy/pages/medicine/medicine_creation_page.dart';
import 'package:online_pharmacy/pages/medicine/medicine_detail_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../models/medicine.dart';

class MedicineListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  late Future<List<Medicine>> _dataList;

  @override
  void initState() {
    super.initState();
    final request = Provider.of<CookieRequest>(context, listen: false);
    _dataList = fetchMedicineList(request);
  }

  void refresh() {
    final request = Provider.of<CookieRequest>(context, listen: false);
    setState(() {
      _dataList = fetchMedicineList(request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Obat"),
      ),
      drawer: const AdminMenu(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicineCreationPage(refreshDataList: () => refresh())));
      },
      child: const Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Medicine>>(
            future: _dataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MedicineListView(dataList: snapshot.data!);
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

class MedicineListView extends StatelessWidget {
  final List<Medicine> dataList;

  const MedicineListView({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(dataList[index].name),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MedicineDetailPage(medicine: dataList[index]))),
              ),
            ));
  }
}
