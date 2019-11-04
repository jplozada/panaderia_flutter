// import 'package:flutter/material.dart';
// import 'package:prueba1/core/models/inventoryModel.dart';
// import 'package:prueba1/core/viewmodels/CRUDModelInventory.dart';
// import 'package:prueba1/ui/views/inventory/ModifyInventory.dart';
// import 'package:provider/provider.dart';

// class InventoryDetails extends StatelessWidget {
//   final Inventory product;

//   InventoryDetails({@required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<CRUDModelInventory>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalle del registro'),
//         actions: <Widget>[
          
//           IconButton(
//             iconSize: 35,
//             icon: Icon(Icons.delete_forever),
//             onPressed: ()async {
//               await productProvider.removeProduct(product.id);
//               Navigator.pushNamed(context, '/readInventory');
//             },
//           ),
//           IconButton(
//             iconSize: 35,
//             icon: Icon(Icons.edit),
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyInventory(product: product,)));
//             },
//           )
//         ],
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             product.nombre,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//           Text(
//             product.cantTotal,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//           Text(
//             product.cantSalida,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//           Text(
//             product.cantEntrada,
//             style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 22,
//                 fontStyle: FontStyle.italic),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:panaderia_flutter/core/models/finalProductModel.dart';
import 'package:panaderia_flutter/core/models/typesofProductsModel.dart';

class FinalProductDetail extends StatefulWidget {

  final FinalProduct product;

  FinalProductDetail({@required this.product});

  @override
  _FinalProductDetailState createState() => _FinalProductDetailState();
}

class _FinalProductDetailState extends State<FinalProductDetail> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(determinaImagen(widget.product.nombre),),
            ),
            Center(
              child: Text(widget.product.nombre),
            ),
            Center(
              child: Text(widget.product.cliente),
            ),
            Center(
              child: Text(widget.product.cantidad.toString()),
            ),
            Center(
              child: Text(widget.product.fecha),
            ),
            Center(
              child: Text(widget.product.hora),
            ),
            Center(
              child: Text(widget.product.tipoPVC),
            ),
            Center(
              child: Text(widget.product.estado),
            ),
          ],
        ),
      ),
    );
  }
}