class InvestModel {
  String? investorEmail;
  String? name;
  int? investorContactNo;
  double? money;

  InvestModel(
      {this.investorEmail, this.name, this.investorContactNo, this.money});

  InvestModel.fromJson(Map<String, dynamic> json) {
    investorEmail = json['investor_email'];
    name = json['name'];
    investorContactNo = json['investor_contact_no'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investor_email'] = this.investorEmail;
    data['name'] = this.name;
    data['investor_contact_no'] = this.investorContactNo;
    data['money'] = this.money;
    return data;
  }
}
