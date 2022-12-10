import 'package:flutter/material.dart';
import 'package:online_pharmacy/menus/customer_menu.dart';
import 'package:online_pharmacy/api/customer_api.dart';
import 'package:online_pharmacy/menus/customer_menu.dart';
import 'package:online_pharmacy/models/customer.dart';
import 'package:online_pharmacy/pages/customer/profile_page.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';



  

class CustomerHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  late Future<List<Customer>> _dataList;

  @override
  void initState() {
    super.initState();
    final request = Provider.of<CookieRequest>(context, listen: false);
    _dataList = fetchCustomer(request);
  }

  void refresh() {
    final request = Provider.of<CookieRequest>(context, listen: false);
    setState(() {
      _dataList = fetchCustomer(request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const CustomerMenu(),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Customer>>(
            future: _dataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomerView(dataList: snapshot.data!);
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

class CustomerView extends StatelessWidget {
  final List<Customer> dataList;

  const CustomerView({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) => Card(
          child: Center( 
            child: Column(
              children: [
                Text("Hello, ${dataList[0].firstname} ${dataList[index].lastname}!", style: Theme.of(context).textTheme.titleLarge,),
                Text("Address: ${dataList[0].address} ", style: Theme.of(context).textTheme.bodyMedium,),
                Text("Phone: ${dataList[0].phone} ", style: Theme.of(context).textTheme.bodyMedium,),
            
              ]
            )

                
                
              ),
            ));
  }}