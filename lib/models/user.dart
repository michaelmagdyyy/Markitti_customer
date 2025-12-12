import 'dart:convert';

import '../main.dart';
import 'base.dart';

class UserModel extends Model {
  UserModel._();

  static UserModel i = UserModel._();

  late String name;
  late String cardNum;
  late String token;
  late String mobileNumber;
  late String email;
  late String locale;



  fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json?["card_info"], "card_id");
    cardNum = stringFromJson(json?["card_info"], "card_id");
    mobileNumber = stringFromJson(json?["card_info"], "mobile_number");
    name = stringFromJson(json?["personal_data"], "full_name");
    email = stringFromJson(json?["personal_data"], "e_mail");
    token = "token";
    locale = stringFromJson(json?["personal_data"], "locale");


  }

  save() {
    Prefs.setString('user', jsonEncode(toJson()));
  }

  clear() {
    Prefs.remove('user');
    fromJson();
  }

  get() {
    String user = Prefs.getString('user') ?? '{}';
    fromJson(jsonDecode(user));
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "token": token,
        "cardNum": cardNum,
        "mobileNumber": mobileNumber,
        "locale": locale,

      };
}
