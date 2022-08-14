class ProfileModel {
  String? email;
  String? lastLogin;
  String? name;
  int? contactNo;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  String? typeOfAccount;

  ProfileModel(
      {this.email,
      this.lastLogin,
      this.name,
      this.contactNo,
      this.isActive,
      this.isStaff,
      this.isSuperuser,
      this.typeOfAccount});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    lastLogin = json['last_login'];
    name = json['name'];
    contactNo = json['contact_no'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    typeOfAccount = json['type_of_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['last_login'] = this.lastLogin;
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['is_active'] = this.isActive;
    data['is_staff'] = this.isStaff;
    data['is_superuser'] = this.isSuperuser;
    data['type_of_account'] = this.typeOfAccount;
    return data;
  }
}
