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
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            vaiParaFormulario(context, (transferencia) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Transferência realizada!'),
              ));
            });
          },
        ),
      ),
    );
  }

  void vaiParaFormulario(
      BuildContext context, Function(Transferencia transferencia) quandoTransferenciaRecebida) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormularioTransferencia(
                  callback: (transferenciaRecebida) {
                    _transferencias.add(transferenciaRecebida);
                    quandoTransferenciaRecebida(transferenciaRecebida);
                  },
                )));
  }
}
