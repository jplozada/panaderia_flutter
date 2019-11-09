import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panaderia_flutter/ui/views/ensamblaje/readEnsamblaje.dart';
import 'package:panaderia_flutter/ui/views/inventory/readFinalProduct.dart';
import 'package:panaderia_flutter/ui/views/litografia/readLitografia.dart';
import 'package:panaderia_flutter/ui/views/tijeras/readtijeras.dart';
import 'package:panaderia_flutter/ui/views/troqueladora/readTroqueladora.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  String _nombre;
  String _contr;
  String _mensaje;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        body: new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new SizedBox(
              height: 20.0,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: new Text("INGRESO AL SISTEMA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
                new SizedBox(
                  height: 30.0,
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'assets/keke.png',
                      height: 150.0,
                      width: 210.0,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
                new Center(
                    child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: new Form(
                            autovalidate: false,
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      //LogInScreen
//                                          Navigator.push(
//                                            context,
//                                            MaterialPageRoute(
//                                                builder: (context) =>
//                                                    LogInScreen('inventario')
//                                            ),
//                                          );
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LogInScreen('LITOGRAFIA'),
                                        ),
                                      );
                                    },
                                    child: new Text(
                                      "LITOGRAFIA",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 111.0,
                                        right: 111.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LogInScreen('TIJERAS'),
                                        ),
                                      );
                                    },
                                    child: new Text(
                                      "TIJERAS",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 122.0,
                                        right: 122.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LogInScreen('TROQUELADORA'),
                                        ),
                                      );
                                    },
                                    child: new Text(
                                      "TROQUELADORA",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 96.0,
                                        right: 96.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LogInScreen('ENSAMBLAJE'),
                                        ),
                                      );
                                    },
                                    child: new Text(
                                      "ENSAMBLAJE",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 105.0,
                                        right: 105.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => LogInScreen(
                                              'REGISTRO DE PRODUCTO FINAL'),
                                        ),
                                      );
                                    },
                                    child: new Text(
                                      "REGISTRO DE PRODUCTO FINAL",
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 47.0,
                                        right: 47.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),

                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 30.0, bottom: 0.0),

                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
class LogInScreen extends StatefulWidget {
  final String _nombre;

  const LogInScreen(this._nombre); // : super(key: key);

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  String _contr;

  //String _mensaje;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        body: new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new SizedBox(
              height: 20.0,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: new Text("INGRESO AL SISTEMA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.left),
                    )
                  ],
                ),
                new SizedBox(
                  height: 30.0,
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'assets/keke.png',
                      height: 150.0,
                      width: 210.0,
                      fit: BoxFit.scaleDown,
                    )
                  ],
                ),
                new Center(
                    child: new Center(
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: new Form(
                            autovalidate: false,
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: new TextFormField(
                                    enabled: false,
                                    controller: email_controller,
                                    autofocus: false,
                                    decoration: new InputDecoration(
                                      labelText: widget._nombre,
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(right: 7.0),
                                          child: new Image.asset(
                                            'assets/user_icon.png',
                                            height: 25.0,
                                            width: 25.0,
                                            //fit: BoxFit.scaleDown,
                                          )),
                                    ),
//                                      onChanged: (text) {
//                                        _nombre2 = widget._nombre;
//                                        print(_nombre2);
//                                      },
                                    //keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 5.0),
                                  child: new TextFormField(
                                    obscureText: true,
                                    autofocus: false,
                                    controller: password_controller,
                                    decoration: new InputDecoration(
                                        labelText: "Contraseña*",
                                        prefixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 7.0),
                                            child: new Image.asset(
                                              'assets/email_icon.png',
                                              height: 25.0,
                                              width: 25.0,
                                              fit: BoxFit.scaleDown,
                                            ))),
                                    onChanged: (text) {
                                      _contr = text;
                                      print(_contr);
                                      print(widget._nombre);
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                new Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0, top: 20.0, bottom: 0.0),
                                  child: new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      if (!(password_controller.value.text
                                              .trim()
                                              .toString()
                                              .length >
                                          1)) {
                                        Fluttertoast.showToast(
                                            msg: "Ingrese la contraseña.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIos: 1);
                                      } else {
                                        /* Fluttertoast.showToast(
                                              msg:
                                              "You have successfull logedin to " +
                                                  email_controller.value.text
                                                      .toString(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIos: 1);
*/
                                        // email_controller.clear();
                                        //password_controller.clear();
                                        //Navigator.of(context).pop(LOGIN_SCREEN);

//                                          var root=MaterialPageRoute(builder: (context)=>
//                                          new HomeScreen(email_controller.value.text.toString()));
//                                        //  Navigator.of(context).pop(LOGIN_SCREEN);
//                                          Navigator.pushReplacement(context, root);

                                        if (widget._nombre == "LITOGRAFIA" &&
                                            _contr == "11111") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReadLitografia()),
                                          );
                                        }
//                                          else {
//                                            if (_nombre != "cristian") {
//                                              setState(() {
//                                                _mensaje = "nombre incorrecto";
//                                              });
//                                            }
//                                            if (_contr != "123456") {
//                                              setState(() {
//                                                _mensaje = "password incorrecto";
//                                              });
//                                            }
//                                          }
                                        else {
                                          if (widget._nombre == "TIJERAS" &&
                                              _contr == "22222") {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReadTijeras()),
                                            );
                                          } else {
                                            if (widget._nombre ==
                                                    "TROQUELADORA" &&
                                                _contr == "33333") {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReadTroqueladora()),
                                              );
                                            } else {
                                              if (widget._nombre ==
                                                      "ENSAMBLAJE" &&
                                                  _contr == "44444") {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReadEnsamblaje()),
                                                );
                                              } else {
                                                if (widget._nombre ==
                                                        "REGISTRO DE PRODUCTO FINAL" &&
                                                    _contr == "55555") {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReadFinalProduct()),
                                                  );
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "No existe ese usuario",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIos: 1);
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    },
                                    child: new Text(
                                      "Ingresar",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Color(0xFFf2a65a),
                                    textColor: Colors.white,
                                    elevation: 5.0,
                                    padding: EdgeInsets.only(
                                        left: 80.0,
                                        right: 80.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
