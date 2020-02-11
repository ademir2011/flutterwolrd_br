class UserModel {
  String name;
  String email;
  String password;
  String passwordConfirm;
  bool actived;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.passwordConfirm,
    this.actived,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordConfirm: json['passwordConfirm'],
      actived: json['actived'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'email': this.email,
        'password': this.password,
        'passwordConfirm': this.passwordConfirm,
        'actived': this.actived,
      };
}
