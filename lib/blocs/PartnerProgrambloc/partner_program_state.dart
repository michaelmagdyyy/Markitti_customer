part of 'partner_program_bloc.dart';

@immutable
sealed class PartnerProgramState {}

final class PartnerProgramInitial extends PartnerProgramState {}
final class PartnerProgramLoading extends PartnerProgramState {}
final class PartnerProgramLoaded extends PartnerProgramState {
  final PartnerProgramModel model;
  PartnerProgramLoaded({required this.model});
}
final class PartnerProgramError extends PartnerProgramState {
  final String msg;
  PartnerProgramError({required this.msg});
}
