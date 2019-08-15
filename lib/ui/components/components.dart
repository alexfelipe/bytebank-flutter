import 'package:bytebank/model/models.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final String dica;
  final IconData icone;
  final TextEditingController controlador;
  final TextInputType tipoTeclado;

  Editor({this.dica,
    this.icone,
    this.controlador,
    this.tipoTeclado});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          keyboardType: tipoTeclado,
          style: TextStyle(fontSize: 30.0),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: dica,
            icon: icone != null ? Icon(icone) : null,
          ),
          controller: controlador),
    );
  }
}