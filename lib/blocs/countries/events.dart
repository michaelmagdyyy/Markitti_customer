import 'package:e_commerce/models/country.dart';

class CountriesEvent {}

class StartCountriesEvent extends CountriesEvent {}

class SelectCountryEvent extends CountriesEvent {
  final CountryModel? model;

  SelectCountryEvent({this.model});
}
