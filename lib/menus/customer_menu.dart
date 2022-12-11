import 'package:flutter/material.dart';
import 'package:online_pharmacy/api/account_api.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CustomerMenu extends StatelessWidget {
  const CustomerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/customer/home");
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/home");
            },
          )
          
        ],
      ),
    );
  }
}
