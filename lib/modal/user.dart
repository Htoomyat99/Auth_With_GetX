class User {
  User(
      {required this.phone,
      required this.userName,
      required this.address,
      required this.dateOfBirth,
      required this.password});

  final String phone, userName, address, dateOfBirth, password;

  factory User.formJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      userName: json['userName'],
      address: json['address'],
      dateOfBirth: json['dateOfBirth'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'userName': userName,
        'address': address,
        'dateOfBirth': dateOfBirth,
        'password': password,
      };
}
