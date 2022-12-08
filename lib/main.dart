

import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/admin_home_page.dart';
import 'package:online_pharmacy/pages/customer_home_page.dart';
import 'package:online_pharmacy/pages/home_page.dart';
import 'package:online_pharmacy/pages/login_page.dart';
import 'package:online_pharmacy/pages/medicine/medicine_list_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
        routes: {
          "/home": (BuildContext context) => const HomePage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/admin/home": (BuildContext context) => const AdminHomePage(),
          "/customer/home": (BuildContext context) => const CustomerHomePage(),
          "/medicine/list": (BuildContext context) => MedicineListPage(),
        },
      ),
    );
  }
}
