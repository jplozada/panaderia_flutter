import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panaderia_flutter/ui/views/ensamblaje/addEnsamblaje.dart';
import 'package:panaderia_flutter/ui/views/ensamblaje/readEnsamblaje.dart';
import 'package:panaderia_flutter/ui/views/inventory/addFinalProduct.dart';
import 'package:panaderia_flutter/ui/views/litografia/readLitografia.dart';
import 'package:panaderia_flutter/ui/views/troqueladora/addTroqueladora.dart';
import 'package:panaderia_flutter/ui/views/troqueladora/readTroqueladora.dart';
import './views/litografia/addLitografia.dart';
import 'package:panaderia_flutter/ui/views/tijeras/readTijeras.dart';
import './views/tijeras/addTijeras.dart';
import './views/homeView.dart';
import 'views/inventory/readFinalProduct.dart';

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
      case '/addEnsamblaje' :
        return MaterialPageRoute(
            builder: (_)=> AddEnsamblaje()
        ) ;
      case '/readEnsamblaje' :
        return MaterialPageRoute(
            builder: (_)=> ReadEnsamblaje()
        ) ;
      case '/addTroqueladora' :
        return MaterialPageRoute(
          builder: (_)=> AddTroqueladora()
        ) ;
      case '/readTroqueladora' :
        return MaterialPageRoute(
          builder: (_)=> ReadTroqueladora()
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