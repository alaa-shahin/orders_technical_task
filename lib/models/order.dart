// Create model Order and inject values from Api in it

class Order {
  String id;
  bool isActive;
  String price;
  String company;
  String picture;
  String buyer;
  List<String> tags;
  String status;
  String registered;

  Order({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  /// Convert json to object
  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] == null ? null : json['id'],
        isActive: json['isActive'] == null ? null : json['isActive'],
        price: json['price'] == null ? null : json['price'],
        company: json['company'] == null ? null : json['company'],
        picture: json['picture'] == null ? null : json['picture'],
        buyer: json['buyer'] == null ? null : json['buyer'],
        tags: json['tags'] == null ? [] : List<String>.from(json["tags"]),
        status: json['status'] == null ? null : json['status'],
        registered: json['registered'] == null ? null : json['registered'],
      );

  /// Convert object to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['price'] = this.price;
    data['company'] = this.company;
    data['picture'] = this.picture;
    data['buyer'] = this.buyer;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['registered'] = this.registered;
    return data;
  }
}
