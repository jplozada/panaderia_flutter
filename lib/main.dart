import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import './core/viewmodels/CRUDModelLitografia.dart';
import './core/viewmodels/CRUDModelTijeras.dart';
import 'package:panaderia_flutter/core/viewmodels/CRUDModelFinalProduct.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelLitografia>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelTijeras>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelFinalProduct>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Product App',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}