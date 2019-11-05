import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panaderia_flutter/ui/views/inventory/addFinalProduct.dart';
import 'package:panaderia_flutter/ui/views/litografia/readLitografia.dart';
import './views/litografia/addLitografia.dart';
import './views/litografia/litografiaDetails.dart';
import 'package:panaderia_flutter/ui/views/tijeras/readTijeras.dart';
import './views/tijeras/addTijeras.dart';
import './views/homeView.dart';
import 'views/inventory/readFinalProduct.dart';
//import './views/homeProduction.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> HomeView()
        );
      case '/addLitografia' :
        return MaterialPageRoute(
          builder: (_)=> AddLitografia()
        ) ;
      case '/readLitografia' :
        return MaterialPageRoute(
            builder: (_)=> ReadLitografia()
        ) ;
      case '/addTijeras' :
        return MaterialPageRoute(
          builder: (_)=> AddTijeras()
        ) ;
      case '/readTijeras' :
        return MaterialPageRoute(
            builder: (_)=> ReadTijeras()
        ) ;
      case '/addFinalProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddFinalProduct()
        ) ;
      case '/readFinalProduct' :
        return MaterialPageRoute(
            builder: (_)=> ReadFinalProduct()
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