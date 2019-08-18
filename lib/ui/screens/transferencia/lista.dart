import 'package:bytebank/model/transferencia.dart';
import 'package:bytebank/ui/components/transferencia/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = List();

  static const _tituloAppBar = "Transferências";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: TransferenciasListView(transferencias: _transferencias),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          vaiParaFormulario(context);
        },
      ),
    );
  }

  void vaiParaFormulario(BuildContext context) async {
    Transferencia transferenciaCriada = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormularioTransferencia()));
    _transferencias.add(transferenciaCriada);
  }

}
