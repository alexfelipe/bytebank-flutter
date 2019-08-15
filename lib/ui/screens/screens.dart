import 'package:bytebank/model/models.dart';
import 'package:bytebank/ui/components/components.dart';
import 'package:bytebank/util/funcoes.dart';
import 'package:flutter/material.dart';

class FormularioConta extends StatelessWidget {

  final quandoCriaTransferencia callback;

  final _contaController = TextEditingController();
  final _valorController = TextEditingController();

  static const confirmar = "Confirmar";
  static const dadosDaTransferencia = "Dados da transferência";

  FormularioConta({@required this.callback});

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
              },
            )
          ],
        ),
      ),
    );
  }
}