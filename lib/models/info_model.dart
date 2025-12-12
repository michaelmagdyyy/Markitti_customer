class InfoModel {
  late final String transactionId;
  late final String brandName;
  late final String category_id;
  late final String branchName;
  late final num invoiceAmount;
  late final num discountPercentage;
  late final num amountToBePaid;
  late final String transactionDateTime;
  InfoModel.fromJson(Map<String, dynamic> json){
    transactionId= json['transaction_id'] ?? '';
    category_id= json['category_id'] ?? '';
    brandName= json['brand_name'] ?? '';
    branchName= json['branch_name'] ?? '';
    invoiceAmount= json['invoice_amount'] ?? 0;
    discountPercentage= json['discount_percentage'] ?? 0;
    amountToBePaid= json['amount_to_be_paid'] ?? 0;
    transactionDateTime= json['transaction_date_time'] ?? '';
  }
}