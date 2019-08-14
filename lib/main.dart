import 'package:flutter/material.dart';

void main() => runApp(TelaInicial());

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CpfFormulario(),
    );
  }
}

class CpfFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preencher formulário"),
      ),
      body: Column(
        children: <Widget>[
          Text("Informe o CPF"),
          Text("dasdasda"),
        ],
      ),
    );
  }
}
