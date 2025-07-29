class CodeModel {

  late final num? availableMonthlyPurchaseLimit;
  late final num? availableDailyPurchaseLimit;
  late final num? discountPercentage;
  late final String? qrCode;
  late final String? currentDateTime;

  CodeModel.fromJson(Map<String, dynamic> json){
    availableMonthlyPurchaseLimit = json['available_monthly_purchase_limit'];
    availableDailyPurchaseLimit = json['available_daily_purchase_limit'];
    discountPercentage = json['discount_percentage'];
    qrCode = json['qr_code'];
    currentDateTime = json['current_date_time'];
  }


}