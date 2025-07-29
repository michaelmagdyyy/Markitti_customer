import 'dart:io';

import 'package:e_commerce/core/routes/app_routes_fun.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/models/city_model.dart';
import 'package:e_commerce/models/country.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../../core/widgets/flash_helper.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEvent>(_register);

    on<UpdateViewEvent>(_updateView);
  }

  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final identityNumController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final numberChildrenController = TextEditingController();
  final jobController = TextEditingController();
  final hobbiesController = TextEditingController();

  final birthday = TextEditingController();


  String? selectedAgeRange;

  final List<String> ageRanges = [
    '18 to 25',
    '26 to 40',
    '41 to 55',
    '56 to 70',
  ];
  bool isMale = true;
  CountryModel? countryModel;
  CityModel? cityModel;


  Future<void> _register(RegisterEvent event, Emitter<RegisterStates> emit) async {
    emit(RegisterLoadingState());

    final deviceToken = await FirebaseMessaging.instance.getToken();

    final response = await ServerGate.i.sendToServer(url: "Authentication/register_new_customer",formData: {
      "pass": passwordController.text,
      "mobile_number": phoneController.text,
      "province_id": countryModel?.provincesId,
      "area_id": cityModel?.areasId,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "card_holder_email": emailController.text,
      "age_group": ageController.text,
      "gender": isMale ? "Male" : "Female",
      "marital_status": maritalStatusController.text,
      "number_of_children": numberChildrenController.text,
      "job": jobController.text,
      "hobbies": hobbiesController.text,
      "date_of_birth": birthday.text,
      "national_id": identityNumController.text,
      "operating_system": Platform.operatingSystem == "ios" ? "IOS" : "Android",
      "fcm_token": deviceToken,
      "device_token": "123"
    });

    if (response.success) {
      replacement(NamedRoutes.login);
      emit(RegisterSuccessState(msg: response.msg));
    } else {
      emit(RegisterFailedState(msg: response.msg));
    }
  }

  _updateView(UpdateViewEvent event, Emitter<RegisterStates> emit) {
    emit(ChangeState());
  }
}
/*
  "card_holder_email": "test1@gmail.com",
 */