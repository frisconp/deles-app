class User {
  int id;
  String name;
  String dateOfBirth;
  String city;
  String address;
  String phoneNumber;
  String email;
  String emailVerifiedAt;
  String avatar;
  String balance;
  String roleId;
  String googleAccountId;
  String gopayAccountId;
  String lastAccessAt;
  String createdAt;
  String updatedAt;

  User({
    this.id,
    this.name,
    this.dateOfBirth,
    this.city,
    this.address,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.balance,
    this.roleId,
    this.googleAccountId,
    this.gopayAccountId,
    this.lastAccessAt,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    city = json['city'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    balance = json['balance'];
    roleId = json['role_id'];
    googleAccountId = json['google_account_id'];
    gopayAccountId = json['gopay_account_id'];
    lastAccessAt = json['last_access_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_of_birth'] = this.dateOfBirth;
    data['city'] = this.city;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['avatar'] = this.avatar;
    data['balance'] = this.balance;
    data['role_id'] = this.roleId;
    data['google_account_id'] = this.googleAccountId;
    data['gopay_account_id'] = this.gopayAccountId;
    data['last_access_at'] = this.lastAccessAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
