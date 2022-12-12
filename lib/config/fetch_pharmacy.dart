import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:online_pharmacy/models/pharmacy.dart';

Future<List<Pharmacy>> fetchPharmacy() async {
  var url = Uri.parse('https://pbp-b01-proyek-tengah-semester.herokuapp.com/pharmacy/retrieve');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Pharmacy> listPharmacy = [];
  for (var element in data){
    if (element != null){
      listPharmacy.add(Pharmacy.fromJson(element));
    }
  }

  return listPharmacy;
}