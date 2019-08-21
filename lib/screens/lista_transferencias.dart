import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatelessWidget {

  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia(100.0, 1000));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future<Transferencia> future = Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              _transferencias.add(transferenciaRecebida);
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final transferencia = _transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
