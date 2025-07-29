
import 'base.dart';

class GeneralModel extends Model {
  late String name;
  late String? image;
  late String? key;

  GeneralModel({required this.key, required this.name,this.image});

  GeneralModel.fromJson(Map<String, dynamic>? json) {
    name = stringFromJson(json, 'title');
    name = stringFromJson(json, 'image');
    id = stringFromJson(json, 'id');
  }

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': name,
        'id': id,
      };
}
