class UsageHistoryModel {
  var status;
  List<UsageHistoryData>? data;
  String? message;

  UsageHistoryModel({this.status, this.data, this.message});

  UsageHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UsageHistoryData>[];
      json['data'].forEach((v) {
        data!.add(new UsageHistoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class UsageHistoryData {
  var transactionValue;
  var discountPercentage;
  var amountToBePaid;
  var status;
  var brandName;
  var brandLogo;
  var branchName;
  var transactionDate;

  UsageHistoryData(
      {this.transactionValue,
        this.discountPercentage,
        this.amountToBePaid,
        this.status,
        this.brandName,
        this.brandLogo,
        this.branchName,
        this.transactionDate});

  UsageHistoryData.fromJson(Map<String, dynamic> json) {
    transactionValue = json['transaction_value'];
    discountPercentage = json['discount_percentage'];
    amountToBePaid = json['amount_to_be_paid'];
    status = json['status'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    branchName = json['branch_name'];
    transactionDate = json['transaction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_value'] = this.transactionValue;
    data['discount_percentage'] = this.discountPercentage;
    data['amount_to_be_paid'] = this.amountToBePaid;
    data['status'] = this.status;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['branch_name'] = this.branchName;
    data['transaction_date'] = this.transactionDate;
    return data;
  }
}