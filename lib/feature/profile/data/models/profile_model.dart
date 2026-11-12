class ProfileResponse {
  final ProfileModel? data;
  final String? message;
  final int? status;

  ProfileResponse({this.data, this.message, this.status});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: json['data'] != null
          ? ProfileModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'status': status,
  };
}

class ProfileModel {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? phone;
  final bool? emailVerified;
  final String? image;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      emailVerified: json['email_verified'] as bool?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'address': address,
    'city': city,
    'phone': phone,
    'email_verified': emailVerified,
    'image': image,
  };
}

class CardModel {
  static const List<String> profileItems = [
    'My Orders',
    'Edit Profile',
    'Reset Password',
    'FAQ',
    'Contact Us',
    'Privacy & Terms',
  ];
}
