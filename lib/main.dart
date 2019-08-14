import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(TelaInicial());

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CpfFormulario(),
    );
  }
}

class CpfFormulario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CpfFormularioState();
  }
}

class CpfFormularioState extends State<CpfFormulario> {
  final _formController = TextEditingController();

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preencher formulário"),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 30.0),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Insira o CPF'),
                  controller: _formController),
            ),
            RaisedButton(
              child: Text("Próximo"),
              onPressed: () {
                print(_formController.value);
              },
            )
          ],
        ),
      ),
    );
  }
}
