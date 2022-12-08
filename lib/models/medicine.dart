class Medicine {
  int? id;
  String name;
  int stock;

  // for pharmacy id in creation page, for pharmacy name in listing page
  String pharmacy;

  Medicine({required this.name,
    required this.stock,
    required this.pharmacy,
    this.id});

  factory Medicine.fromUserInput() {
    return Medicine(name: "", stock: 0, pharmacy: "");
  }

  factory Medicine.fromJson(Map<String, dynamic> json) {
    final field = json["fields"];
    return Medicine(
        name: field["name"],
        stock: field["stock"],
        pharmacy: field["pharmacy"],
        id: json["pk"]);
  }

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "stock": "$stock",
        "pharmacy": pharmacy,
      };
}