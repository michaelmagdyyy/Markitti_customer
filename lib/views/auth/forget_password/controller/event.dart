class ForgetPasswordEvents {}

class ForgetPasswordEvent extends ForgetPasswordEvents {
  final String phoneCode;

  ForgetPasswordEvent({required this.phoneCode});
}
