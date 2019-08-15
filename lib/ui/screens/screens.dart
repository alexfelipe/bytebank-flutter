import 'package:bytebank/model/models.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:bytebank/util/funcoes.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: ListView.builder(
          itemCount: transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = transferencias[indice];
            return ListTile(
              onTap: () {},
              leading: Icon(Icons.monetization_on),
              title: Text(transferencia.valor.toString()),
              subtitle: Text(transferencia.numeroConta.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FormularioTransferencia(
                        callback: (transferenciaCriada) =>
                            transferencias.add(transferenciaCriada),
                      )));
        },
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final quandoCriaTransferencia callback;

  final _contaController = TextEditingController();
  final _valorController = TextEditingController();

  static const confirmar = "Confirmar";
  static const dadosDaTransferencia = "Dados da transferência";

  FormularioTransferencia({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dadosDaTransferencia),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            Editor(
              dica: "Número da conta",
              controlador: _contaController,
              tipoTeclado: TextInputType.number,
            ),
            Editor(
              dica: "0,00",
              icone: Icons.monetization_on,
              controlador: _valorController,
              tipoTeclado: TextInputType.number,
            ),
            RaisedButton(
              child: Text(confirmar),
              onPressed: () {
                final valor = _valorController.text;
                final conta = _contaController.text;
                var transferenciaCriada =
                    Transferencia(int.tryParse(conta), double.tryParse(valor));
                callback(transferenciaCriada);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
