class PartnerProgramModel {
  String? status;
  PartnerProgramData? data;
  String? message;

  PartnerProgramModel({this.status, this.data, this.message});

  PartnerProgramModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PartnerProgramData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class PartnerProgramData {
  String? partnerProgram;

  PartnerProgramData({this.partnerProgram});

  PartnerProgramData.fromJson(Map<String, dynamic> json) {
    partnerProgram = json['partner_program'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partner_program'] = this.partnerProgram;
    return data;
  }
}