import 'package:online_pharmacy/models/medicine.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config/app_config.dart';

Future<List<Medicine>> fetchMedicineList(CookieRequest request) async {
  final response = await request.get("$apiUrl/medicine/retrieve");
  return response.map<Medicine>((record) => Medicine.fromJson(record)).toList();
}