class Product {
  int id;
  String pName;
  String pPrice;
  String pDescription;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
    required this.id,
    required this.pName,
    required this.pPrice,
    required this.pDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    pName: json['p_name'],
    pPrice: json['p_price'],
    pDescription: json['p_description'],
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'p_name': pName,
    'p_price': pPrice,
    'p_description': pDescription,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
