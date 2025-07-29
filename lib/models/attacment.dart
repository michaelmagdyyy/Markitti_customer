import 'base.dart';

class AttachmentModel extends Model {
  String? media;

  AttachmentModel({super.id, this.media});

  AttachmentModel.fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
    media = stringFromJson(json, 'media');
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "file_path": media,
      };
}
