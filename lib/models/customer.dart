
class Customer {
  int? id;
  String firstname, lastname, address;
  int phone;

  Customer({required this.firstname,
    required this.lastname,
    required this.address,
    required this.phone,
    this.id});

  factory Customer.fromUserInput() {
    return Customer(firstname: "",lastname:"", phone: 0, address: "");
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    final field = json["fields"];
    return Customer(
        firstname: field["first_name"],
        lastname:field["last_name"],
        phone: field["phone"],
        address: field["address"],
        id: json["pk"]);
  }

  Map<String, dynamic> toJson() =>
      {
        "first_name": firstname,
        "last_name":lastname,
        "address": address,
        "phone": phone,
      };
}