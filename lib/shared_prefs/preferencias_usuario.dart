import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  int get genero {
    return _prefs.getInt("genero") ?? 1;
  }

  set genero(int value) {
    _prefs.setInt("genero", value);
  }

  // Los get y set del _colorSecundario

  bool get colorSecundario {
    return _prefs.getBool("colorSecundario") ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool("colorSecundario", value);
  }

  // Los get y set del _colorSecundario

  String get nombre {
    return _prefs.getString("nombre") ?? '';
  }

  set nombre(String value) {
    _prefs.setString("nombre", value);
  }

  // Los get y set del ultima pagina

  String get ultimaPagina {
    return _prefs.getString("ultimaPagina") ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString("ultimaPagina", value);
  }
}
