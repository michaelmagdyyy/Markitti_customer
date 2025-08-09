class StaticPagesStates {}

class StaticPagesInitial extends StaticPagesStates {}


class StaticPagesLoadingState extends StaticPagesStates {}

class StaticPagesSuccessState extends StaticPagesStates {}

class StaticPagesFailedState extends StaticPagesStates {
  final String msg;

  StaticPagesFailedState({required this.msg});
}
