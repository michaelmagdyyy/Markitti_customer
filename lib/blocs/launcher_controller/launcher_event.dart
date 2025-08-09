part of 'launcher_bloc.dart';

class LauncherEvents {}

class LauncherEvent extends LauncherEvents {
  final String? phone;

  LauncherEvent({required this.phone});
}
