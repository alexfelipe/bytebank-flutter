import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return _ListaTransferenciaState();
  }
}

class _ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _vaiParaFormulario(context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final transferencia = widget._transferencias[index];
          return _ItemTransferencia(transferencia);
        },
      ),
    );
  }

  void _vaiParaFormulario(BuildContext context) {
    Future<Transferencia> future = Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormularioTransferencia();
    }));
    future.then((transferenciaRecebida) {
      _adiciona(transferenciaRecebida);
    });
  }

  void _adiciona(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class _ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  _ItemTransferencia(this._transferencia);

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
