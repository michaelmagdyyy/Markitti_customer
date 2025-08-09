import '../../models/city_model.dart';

class CitiesEvents {}

class CitiesEvent extends CitiesEvents {
  final String countryId;

  CitiesEvent({required this.countryId});
}

class SelectCityEvent extends CitiesEvents {
  final CityModel? model;

  SelectCityEvent({this.model});
}
