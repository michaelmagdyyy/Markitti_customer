class CitiesStates {}

class CitiesInitial extends CitiesStates {}

class CitiesLoadingState extends CitiesStates {}

class CitiesSuccessState extends CitiesStates {}

class CitiesFailedState extends CitiesStates {
  final String msg;

  CitiesFailedState({required this.msg});
}


class SelectCityState extends CitiesStates {}