import 'package:bytebank/model/transferencia.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final _contaController = TextEditingController();
  final _valorController = TextEditingController();

  static const _dicaNumeroConta = "Número da conta";
  static const _dicaValor = "0,00";
  static const _confirmar = "Confirmar";
  static const _dadosDaTransferencia = "Dados da transferência";

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
              Navigator.pop(context, _criaTransferencia());
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
