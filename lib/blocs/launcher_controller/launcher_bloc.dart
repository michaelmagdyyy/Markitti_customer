import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launcher_event.dart';
part 'launcher_state.dart';

class LauncherBloc extends Bloc<LauncherEvents, LauncherStates> {
  LauncherBloc() : super(LauncherStates()) {
    on<LauncherEvent>(_launcher);
  }

  _launcher(LauncherEvent event, Emitter<LauncherStates> emit) async {
    final Uri url = Uri.parse(whatsLauncher(event.phone ?? ""));
    if (await launchUrl(url, mode: Platform.isAndroid ? LaunchMode.externalApplication : LaunchMode.platformDefault)) {
      emit(LauncherSuccessState());
    }
  }

  String whatsLauncher(String phone) {
    return "https://wa.me/$phone";
  }
}
