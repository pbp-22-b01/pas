import 'package:flutter/material.dart';
import 'package:online_pharmacy/menus/admin_menu.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      drawer: const AdminMenu(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Text("Welcome Admin!")),
      ),
    );
  }
}