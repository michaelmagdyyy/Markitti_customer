class SavingsCurrentMonthModel {
  String? status;
  num? tatalSavings;

  SavingsCurrentMonthModel({this.status, this.tatalSavings});

  SavingsCurrentMonthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tatalSavings = json['tatal_savings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['tatal_savings'] = this.tatalSavings;
    return data;
  }
}