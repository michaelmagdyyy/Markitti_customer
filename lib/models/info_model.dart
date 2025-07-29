class InfoModel {

  late final String? brandName;
  late final String? branchName;
  late final num? invoiceAmount;
  late final num? discountPercentage;
  late final num? amountToBePaid;
  late final String? transactionDateTime;

  InfoModel.fromJson(Map<String, dynamic> json){
    brandName = json['brand_name'];
    branchName = json['branch_name'];
    invoiceAmount = json['invoice_amount'];
    discountPercentage = json['discount_percentage'];
    amountToBePaid = json['amount_to_be_paid'];
    transactionDateTime = json['transaction_date_time'];
  }

}