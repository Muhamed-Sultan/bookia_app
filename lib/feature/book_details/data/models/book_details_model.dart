class BookDetailsModel {
  final BookDataModel? data;
  final String? message;
  final int? status;

  BookDetailsModel({this.data, this.message, this.status});

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      data: json['data'] != null ? BookDataModel.fromJson(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.toJson(), 'message': message, 'status': status};
  }
}

class BookDataModel {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? stock;
  final int? discount;
  final double? priceAfterDiscount;
  final String? image;
  final String? category;
  final String? special;

  BookDataModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.discount,
    this.priceAfterDiscount,
    this.image,
    this.category,
    this.special,
  });

  factory BookDataModel.fromJson(Map<String, dynamic> json) {
    return BookDataModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']?.toString(),
      stock: json['stock'],
      discount: json['discount'],
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
      image: json['image'],
      category: json['category'],
      special: json['special'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'discount': discount,
      'price_after_discount': priceAfterDiscount,
      'image': image,
      'category': category,
      'special': special,
    };
  }
}
