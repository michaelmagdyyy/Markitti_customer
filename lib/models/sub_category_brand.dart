// class SubBrandModel {
//   late final String? brandId;
//   late final String? brandName;
//   late final String? brandLogo;
//   late final String? bannerImage;
//   late final String? customerBrandDiscountPercentage;
//   late final String? customerBrandPurchasesLimit;
//
//   SubBrandModel.fromJson(Map<String, dynamic> json) {
//     brandId = json['brand_id'];
//     brandName = json['brand_name'];
//     brandLogo = json['brand_logo'];
//     bannerImage = json['banner_image'];
//     customerBrandDiscountPercentage = json['customer_brand_discount_percentage'];
//     customerBrandPurchasesLimit = json['customer_brand_purchases_limit'];
//   }
// }
class SubBrandModel {
  late final String? brandId;
  late final String? brandName;
  late final String? brandLogo;
  late final String? bannerImage;
  late final String? customerBrandDiscountPercentage;
  late final String? customerBrandPurchasesLimit;
  late final String? averageRating;
  late final String? is_favorite;

  SubBrandModel({
    this.brandId,
    this.brandName,
    this.brandLogo,
    this.averageRating,
    this.bannerImage,
    this.customerBrandDiscountPercentage,
    this.customerBrandPurchasesLimit,
    this.is_favorite,
  });

  SubBrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    averageRating = json['average_rating'];
    bannerImage = json['banner_image'];
    customerBrandDiscountPercentage = json['customer_brand_discount_percentage'];
    customerBrandPurchasesLimit = json['customer_brand_purchases_limit'];
    is_favorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    return {
      'brand_id': brandId,
      'brand_name': brandName,
      'brand_logo': brandLogo,
      'average_rating': averageRating,
      'banner_image': bannerImage,
      'customer_brand_discount_percentage': customerBrandDiscountPercentage,
      'customer_brand_purchases_limit': customerBrandPurchasesLimit,
      'is_favorite': is_favorite,
    };
  }
}
