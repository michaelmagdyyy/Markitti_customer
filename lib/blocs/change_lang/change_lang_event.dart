part of 'change_lang_bloc.dart';

class ChangeLangEvents {}

class ChangeLangEvent extends ChangeLangEvents {
  final String lang;

  ChangeLangEvent({required this.lang});
}

