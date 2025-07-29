class PersonModel {
  late final CardInfo? cardInfo;
  late final DeviceInfo? deviceInfo;
  late final PersonalData? personalData;
  late final String? csrfTokenName;
  late final String? csrfTokenValue;

  PersonModel.fromJson(Map<String, dynamic> json) {
    cardInfo = CardInfo.fromJson(json['card_info']);
    deviceInfo = DeviceInfo.fromJson(json['device_info']);
    personalData = PersonalData.fromJson(json['personal_data']);
    csrfTokenName = json['csrf_token_name'];
    csrfTokenValue = json['csrf_token_value'];
  }
}

class CardInfo {
  late final String? cardId;
  late final String? cardNo;
  late final String? mobileNumber;

  CardInfo.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardNo = json['card_no'];
    mobileNumber = json['mobile_number'];
  }
}

class DeviceInfo {
  late final String? deviceStatus;

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    deviceStatus = json['device_status'];
  }
}

class PersonalData {
  late final String? fullName;
  late final String? eMail;
  late final String? gender;
  late final String? ageGroup;
  late final String? provinceName;
  late final String? areaName;
  late final String? dateOfBirth;

  PersonalData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    eMail = json['e_mail'];
    gender = json['gender'];
    ageGroup = json['age_group'];
    provinceName = json['province_name'];
    areaName = json['area_name'];
    dateOfBirth = json['date_of_birth'];
  }
}
