part of 'change_pass_bloc.dart';

class ChangePasswordEvents {}

class ChangePasswordEvent extends ChangePasswordEvents {
  final String code, phone, phoneCode;

  ChangePasswordEvent({
    required this.code,
    required this.phone,
    required this.phoneCode,
  });
}
