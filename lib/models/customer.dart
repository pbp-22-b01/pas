
class Customer {
  int? id;
  String firstname, lastname, address;
  String phone;

  Customer({required this.firstname,
    required this.lastname,
    required this.address,
    required this.phone,
    this.id});

  factory Customer.fromUserInput() {
    return Customer(firstname: "",lastname:"", phone: "", address: "");
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    final field = json;
    return Customer(
        firstname: field["first_name"],
        lastname:field["last_name"],
        phone: field["phone"],
        address: field["address"],);
  }

  Map<String, dynamic> toJson() =>
      {
        "first_name": firstname,
        "last_name":lastname,
        "address": address,
        "phone": phone,
      };
}