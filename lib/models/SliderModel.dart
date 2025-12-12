class SliderModel {
  String? status;
  List<SliderData>? data;

  SliderModel({this.status, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SliderData>[];
      json['data'].forEach((v) {
        data!.add(new SliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderData {
  String? slidersId;
  String? sliderPhoto;
  String? status;
  String? sliderOrder;
  String? sliderCreatedAt;
  String? sliderCreatedBy;
  String? sliderUpdatedAt;
  String? sliderUpdatedBy;

  SliderData(
      {this.slidersId,
        this.sliderPhoto,
        this.status,
        this.sliderOrder,
        this.sliderCreatedAt,
        this.sliderCreatedBy,
        this.sliderUpdatedAt,
        this.sliderUpdatedBy});

  SliderData.fromJson(Map<String, dynamic> json) {
    slidersId = json['sliders_id'];
    sliderPhoto = json['slider_photo'];
    status = json['status'];
    sliderOrder = json['slider_order'];
    sliderCreatedAt = json['slider_created_at'];
    sliderCreatedBy = json['slider_created_by'];
    sliderUpdatedAt = json['slider_updated_at'];
    sliderUpdatedBy = json['slider_updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sliders_id'] = this.slidersId;
    data['slider_photo'] = this.sliderPhoto;
    data['status'] = this.status;
    data['slider_order'] = this.sliderOrder;
    data['slider_created_at'] = this.sliderCreatedAt;
    data['slider_created_by'] = this.sliderCreatedBy;
    data['slider_updated_at'] = this.sliderUpdatedAt;
    data['slider_updated_by'] = this.sliderUpdatedBy;
    return data;
  }
}