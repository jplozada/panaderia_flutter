import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panaderia_flutter/ui/views/inventory/readInventory.dart';
import './views/inventory/addInventory.dart';
import './views/inventory/inventoryDetails.dart';
import './views/homeView.dart';
//import './views/homeProduction.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> HomeView()
        );
      case '/addInventory' :
        return MaterialPageRoute(
          builder: (_)=> AddInventory()
        ) ;
      // case '/inventoryDetails' :
      //   return MaterialPageRoute(
      //       builder: (_)=> InventoryDetails()
      //   ) ;
      case '/readInventory' :
        return MaterialPageRoute(
            builder: (_)=> ReadInventory()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}