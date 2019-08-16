import 'package:bytebank/model/transferencia.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef QuandoCriaTransferencia = void Function(
    Transferencia transferenciaCriada);

class FormularioTransferencia extends StatelessWidget {
  final QuandoCriaTransferencia callback;
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
        title: const Text(_dadosDaTransferencia),
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
    final double valor = double.tryParse(_valorController.text);
    final int conta = int.tryParse(_contaController.text);
    return Transferencia(conta, valor);
  }
}
