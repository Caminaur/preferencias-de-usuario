import 'package:flutter/material.dart';
import 'package:preferenciasdeusuarioapp/shared_prefs/preferencias_usuario.dart';

import 'package:preferenciasdeusuarioapp/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: Text("Preferencias de Usuario"),
        backgroundColor: (prefs.colorSecundario ? Colors.teal : Colors.blue),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Color Secundario: ${prefs.colorSecundario == true ? 'Activado' : 'Desactivado'}"),
          Divider(),
          Text("Genero: ${prefs.genero == 1 ? 'Hombre' : 'Mujer'}"),
          Divider(),
          Text("Nombre de Usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}
