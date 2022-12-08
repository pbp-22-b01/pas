import 'package:flutter/material.dart';
import 'package:online_pharmacy/menus/customer_menu.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      drawer: const CustomerMenu(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Text("Welcome!")),
      ),
    );
  }
}