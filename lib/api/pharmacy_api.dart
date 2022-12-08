import 'package:online_pharmacy/models/pharmacy.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config/app_config.dart';

Future<List<Pharmacy>> fetchPharmacyList(CookieRequest request) async {
  final response = await request.get("$apiUrl/pharmacy/retrieve");
  return response.map<Pharmacy>((record) => Pharmacy.fromJson(record)).toList();
}

