class BookModel {
  Data? data;
  String? message;
  int? status;

  BookModel({this.data, this.message, this.status});

  BookModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>);
    message = json['message']?.toString();
    status = _toInt(json['status']);
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'status': status,
  };
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    products = (json['products'] as List?)
        ?.map((e) => Products.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Map<String, dynamic> toJson() => {
    'products': products?.map((e) => e.toJson()).toList(),
  };
}

class Products {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  Products({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = _toInt(json['id']);
    name = json['name']?.toString();
    description = json['description']?.toString();
    price = json['price']?.toString();
    discount = _toInt(json['discount']);
    priceAfterDiscount = _toDouble(json['price_after_discount']);
    stock = _toInt(json['stock']);
    bestSeller = _toInt(json['best_seller']);
    image = json['image']?.toString();
    category = json['category']?.toString();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'discount': discount,
    'price_after_discount': priceAfterDiscount,
    'stock': stock,
    'best_seller': bestSeller,
    'image': image,
    'category': category,
  };
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString());
}

double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
