
import 'package:get_it/get_it.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelTijeras.dart';
import './core/services/api.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ApiLitografia('litografia'));
  locator.registerLazySingleton(() => CRUDModelLitografia()) ;
    locator.registerLazySingleton(() => ApiTijeras('tijeras'));
  locator.registerLazySingleton(() => CRUDModelTijeras()) ;
}