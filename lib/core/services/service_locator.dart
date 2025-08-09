import 'package:e_commerce/blocs/cities/bloc.dart';
import 'package:e_commerce/views/auth/register/controller/register_bloc.dart';
import 'package:e_commerce/views/categories/controller/bloc.dart';
import 'package:e_commerce/views/generate_otp/controller/bloc.dart';
import 'package:e_commerce/views/nav_bar/new_service/controller/bloc.dart';
import 'package:e_commerce/views/sub_categories/controller/bloc.dart';
import 'package:e_commerce/views/sub_sub/controller/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../blocs/countries/bloc.dart';
import '../../views/auth/login/controller/bloc.dart';
import '../../views/brand_details/controller/bloc.dart';
import 'location_service.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => LocationService());
    sl.registerFactory(() => LoginBloc());
    sl.registerFactory(() => RegisterBloc());
    sl.registerFactory(() => CategoriesBloc());
    sl.registerFactory(() => NewServicesBloc());
    sl.registerFactory(() => SubCategoriesBloc());
    sl.registerFactory(() => SubSubCategoriesBloc());
    sl.registerFactory(() => BrandDetailsBloc());
    sl.registerFactory(() => CountriesBloc());
    sl.registerFactory(() => CitiesBloc());
    sl.registerFactory(() => CodeBloc());
  }
}
