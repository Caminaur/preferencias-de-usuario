import 'package:flutter/material.dart';
import 'package:preferenciasdeusuarioapp/shared_prefs/preferencias_usuario.dart';
import 'package:preferenciasdeusuarioapp/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;
  String _nombre = "Pedro";

  late TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _colorSecundario = prefs.colorSecundario;
    _genero = prefs.genero;
    _textController = new TextEditingController(text: prefs.nombre);
  }

  _setSelectedRadio(int? valor) {
    _genero = valor!;
    prefs.genero = valor;
    // grabar en preferencias del cliente
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.colorSecundario ? Colors.teal : Colors.blue),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Ajustes",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text("Color secundario"),
            onChanged: (booleano) {
              setState(() {
                _colorSecundario = booleano;
                prefs.colorSecundario = booleano;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (String value) {
                prefs.nombre = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
