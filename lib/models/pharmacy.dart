class Pharmacy {
  int? id;
  String name;
  String address;

  Pharmacy({required this.name, required this.address, this.id});

  factory Pharmacy.fromUserInput() {
    return Pharmacy(name: "", address: "");
  }

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    final field = json["fields"];
    return Pharmacy(
        name: field["name"], address: field["address"], id: json["pk"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
      };
}
