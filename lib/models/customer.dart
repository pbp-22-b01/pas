
class Customer {
  int? id;
  String name, address;
  int number;

  Customer({required this.name,
    required this.address,
    required this.number,
    this.id});

  factory Customer.fromUserInput() {
    return Customer(name: "", number: 0, address: "");
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    final field = json["fields"];
    return Customer(
        name: field["name"],
        number: field["number"],
        address: field["address"],
        id: json["pk"]);
  }

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "address": address,
        "number": number,
      };
}