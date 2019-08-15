import 'package:bytebank/model/models.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:bytebank/util/funcoes.dart';
import 'package:flutter/material.dart';

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
        title: Text(_tituloAppBar),
      ),
      body: transferenciasWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          vaiParaFormulario(context);
        },
      ),
    );
  }

  void vaiParaFormulario(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormularioTransferencia(
                  callback: (transferenciaCriada) =>
                      _transferencias.add(transferenciaCriada),
                )));
  }

  ListView transferenciasWidget() => ListView.builder(
      itemCount: _transferencias.length,
      itemBuilder: (context, indice) {
        final transferencia = _transferencias[indice];
        return ListTile(
          onTap: () {},
          leading: Icon(Icons.monetization_on),
          title: Text(transferencia.valor.toString()),
          subtitle: Text(transferencia.numeroConta.toString()),
        );
      });
}

class FormularioTransferencia extends StatelessWidget {
  final quandoCriaTransferencia callback;
  final _contaController = TextEditingController();
  final _valorController = TextEditingController();

  static const _dicaNumeroConta = "Número da conta";
  static const _dicaValor = "0,00";
  static const _confirmar = "Confirmar";
  static const _dadosDaTransferencia = "Dados da transferência";

  FormularioTransferencia({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dadosDaTransferencia),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            dica: _dicaNumeroConta,
            controlador: _contaController,
            tipoTeclado: TextInputType.number,
          ),
          Editor(
            dica: _dicaValor,
            icone: Icons.monetization_on,
            controlador: _valorController,
            tipoTeclado: TextInputType.number,
          ),
          RaisedButton(
            child: Text(_confirmar),
            onPressed: () {
              callback(_criaTransferencia());
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Transferencia _criaTransferencia() {
    final valor = _valorController.text;
    final conta = _contaController.text;
    return Transferencia(int.tryParse(conta), double.tryParse(valor));
  }
}
