class TermsAndConditionsModel {
  String? status;
  String? termsAndCondistions;

  TermsAndConditionsModel({this.status, this.termsAndCondistions});

  TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    termsAndCondistions = json['terms_and_condistions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['terms_and_condistions'] = this.termsAndCondistions;
    return data;
  }
}
