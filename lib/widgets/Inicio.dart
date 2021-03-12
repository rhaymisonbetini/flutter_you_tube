import 'package:flutter/material.dart';
import 'package:flutter_you_tube_api/services/Api.dart';

class Inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();

    api.pesquisar('tensorflow.js');

    return Container();
  }
}
