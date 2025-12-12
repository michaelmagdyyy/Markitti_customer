part of 'terms_bloc.dart';

@immutable
sealed class TermsState {}

final class TermsInitial extends TermsState {}
final class TermsLoading extends TermsState {}
final class TermsLoaded extends TermsState {
  final TermsAndConditionsModel model;
  TermsLoaded({required this.model});
}
final class TermsError extends TermsState {
  final String msg;
  TermsError({required this.msg});
}
