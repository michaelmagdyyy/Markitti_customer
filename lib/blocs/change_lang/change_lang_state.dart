part of 'change_lang_bloc.dart';

class ChangeLangStates {}

class SelectLangState extends ChangeLangStates {}

class ChangeLangLoadingState extends ChangeLangStates {}

class ChangeLangSuccessState extends ChangeLangStates {}

class ChangeLangFailedState extends ChangeLangStates {
  final String msg;

  ChangeLangFailedState({required this.msg}) {
    FlashHelper.showToast(msg);
  }
}
