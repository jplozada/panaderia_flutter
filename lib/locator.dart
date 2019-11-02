
import 'package:get_it/get_it.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelLitografia.dart';
import './core/services/api.dart';
import './core/viewmodels/CRUDModelInventory.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ApiInventory('inventory'));
  locator.registerLazySingleton(() => CRUDModelInventory()) ;
  locator.registerLazySingleton(() => ApiLitografia('litografia'));
  locator.registerLazySingleton(() => CRUDModelLitografia()) ;
}