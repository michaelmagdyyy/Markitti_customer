import 'dart:io';

import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/services/cache_helper.dart';
import 'package:e_commerce/models/person_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes_fun.dart';
import '../../../../core/services/server_gate.dart';
import 'event.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<StartLoginEvent>(_fun);
  }

  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final phone = TextEditingController();
  final password = TextEditingController();
   PersonModel? userModel;

  Future<void> _fun(StartLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());

    final deviceToken = await FirebaseMessaging.instance.getToken();
    final response = await ServerGate.i.sendToServer(
      url: 'Authentication/sign_in',

      /// add platform for web
      body: {
        "mobile_number": phone.text,
        "pass": password.text,
        "operating_system": Platform.operatingSystem == "ios" ? "IOS" : "Android",
        "device_token": deviceToken
      },
    );
    if (response.success) {
      // if (response.data["data"]["is_active"] == false) {
      //   // push(VerifyCodeScreen(fromRegister: true, phone: phone.text, phoneCode: event.phoneCode));
      //   emit(FailedLoginState(response.msg));
      // } else {
      //   userModel = UserModel.i.save();
      //
      //   emit(DoneLoginState(response.msg));
      // }
      // userModel = UserModel.i.fromJson(response.data['data']);
      // userModel = UserModel.i.save();
     userModel=PersonModel.fromJson(response.data['data']);
     print(userModel);
      saveData(model: userModel!);
      pushAndRemoveUntil(NamedRoutes.navBar);
      emit(DoneLoginState(response.msg));
    } else {
      print(response.msg);
      emit(FailedLoginState(response.msg));
    }
  }
}
