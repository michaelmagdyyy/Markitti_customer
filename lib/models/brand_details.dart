class BrandDetailsModel {
  late final String? status;
  late final num? availableMonthlyPurchaseLimit;
  late final num? availableDailyPurchaseLimit;
  late final String? subscribtionStatus;
  late final Brand? brand;
  late final num? brandAverageRating;
  late final List<Branches>? branches;
  late final List<Photos>? photos;
  late final List<Videos>? videos;
  late final List<Reviews>? reviews;

  BrandDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    availableMonthlyPurchaseLimit = json['available_monthly_purchase_limit'];
    availableDailyPurchaseLimit = json['available_daily_purchase_limit'];
    subscribtionStatus = json['subscribtion_status'];
    brandAverageRating = json['brand_average_rating'];
    brand = Brand.fromJson(json['brand']);
    branches = List.from(json['branches']).map((e) => Branches.fromJson(e)).toList();
    photos = List.from(json['photos']).map((e) => Photos.fromJson(e)).toList();
    videos = List.from(json['videos']).map((e) => Videos.fromJson(e)).toList();
    reviews = List.from(json['reviews']).map((e) => Reviews.fromJson(e)).toList();
  }
}
class Reviews {
  String? cardUsageRatingHeadId;
  String? customerName;
  String? overallRating;
  String? recommendation;
  String? complaint;
  String? reviewDate;
  List<Factors>? factors;

  Reviews(
      {this.cardUsageRatingHeadId,
        this.customerName,
        this.overallRating,
        this.recommendation,
        this.complaint,
        this.reviewDate,
        this.factors});

  Reviews.fromJson(Map<String, dynamic> json) {
    cardUsageRatingHeadId = json['card_usage_rating_head_id'];
    customerName = json['customer_name'];
    overallRating = json['overall_rating'];
    recommendation = json['recommendation'];
    complaint = json['complaint'];
    reviewDate = json['review_date'];
    if (json['factors'] != null) {
      factors = <Factors>[];
      json['factors'].forEach((v) {
        factors!.add(new Factors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_usage_rating_head_id'] = this.cardUsageRatingHeadId;
    data['customer_name'] = this.customerName;
    data['overall_rating'] = this.overallRating;
    data['recommendation'] = this.recommendation;
    data['complaint'] = this.complaint;
    data['review_date'] = this.reviewDate;
    if (this.factors != null) {
      data['factors'] = this.factors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Factors {
  String? factorNameEn;
  String? factorNameAr;
  String? factorRating;

  Factors({this.factorNameEn, this.factorNameAr, this.factorRating});

  Factors.fromJson(Map<String, dynamic> json) {
    factorNameEn = json['factor_name_en'];
    factorNameAr = json['factor_name_ar'];
    factorRating = json['factor_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['factor_name_en'] = this.factorNameEn;
    data['factor_name_ar'] = this.factorNameAr;
    data['factor_rating'] = this.factorRating;
    return data;
  }
}
class Brand {
  late final String? mainCategoryId;
  late final String? subCategoryId;
  late final String? subSubCategoryId;
  late final String? brandName;
  late final String? description;
  late final String? roles;
  late final String? brandLogo;
  late final String? facebookPage;
  late final String? youtubeChannelLink;
  late final String? instagramLink;
  late final String? visible;
  late final String? bannerImage;

  Brand.fromJson(Map<String, dynamic> json){
    mainCategoryId = json['main_category_id'];
    subCategoryId = json['sub_category_id'];
    subSubCategoryId = json['sub_sub_category_id'];
    brandName = json['brand_name'];
    description = json['description'];
    roles = json['roles'];
    brandLogo = json['brand_logo'];
    facebookPage = json['facebook_page'];
    youtubeChannelLink = json['youtube_channel_link'];
    instagramLink = json['instagram_link'];
    visible = json['visible'];
    bannerImage = json['banner_image'];
  }
}

class Branches {
  late final String? branchAddress;
  late final String? branchLocation;
  late final String? branchMobile_1;
  late final String? branchMobile_2;
  late final dynamic tel_1;
  late final dynamic tel_2;
  late final String? branchName;
  late final String? provinceName;
  late final String? areaName;
  late final String? visible;

  Branches.fromJson(Map<String, dynamic> json){
    branchAddress = json['branch_address'];
    branchLocation = json['branch_location'];
    branchMobile_1 = json['branch_mobile_1'];
    branchMobile_2 = json['branch_mobile_2'];
    tel_1 = null;
    tel_2 = null;
    branchName = json['branch_name'];
    provinceName = json['province_name'];
    areaName = json['area_name'];
    visible = json['visible'];
  }
}

class Photos {
  late final String? brandsPhotosId;
  late final String? brandId;
  late final String? brandPhoto;
  late final String? createdAtByBrand;

  Photos.fromJson(Map<String, dynamic> json) {
    brandsPhotosId = json['brands_photos_id'];
    brandId = json['brand_id'];
    brandPhoto = json['brand_photo'];
  }
}

class Videos {
  late final String? brandsVideosId;
  late final String? brandId;
  late final String? brandVideoLink;
  late final String? createdAt;
  late final String? createdBy;

  Videos.fromJson(Map<String, dynamic> json) {
    brandsVideosId = json['brands_videos_id'];
    brandId = json['brand_id'];
    brandVideoLink = json['brand_video_link'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];

  }
}
