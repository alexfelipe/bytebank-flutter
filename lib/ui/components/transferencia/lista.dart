import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferenciasListView extends StatelessWidget {
  final List<Transferencia> transferencias;

  TransferenciasListView({this.transferencias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = transferencias[indice];
          return TransferenciaItem(transferencia);
        });
  }
}

class TransferenciaItem extends StatelessWidget {
  final Transferencia _transferencia;

  TransferenciaItem(this._transferencia) : assert(_transferencia != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    );
  }
}
