import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            rotulo: 'Número da conta',
            dica: '0000',
            controlador: _controladorCampoNumeroConta,
          ),
          Editor(
              rotulo: 'Valor',
              dica: '0.00',
              controlador: _controladorCampoValor,
              icone: Icons.monetization_on),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                criaTransferencia();
              },
            ),
          )
        ],
      ),
    );
  }

  void criaTransferencia() {
    final int conta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, conta);
    }
  }
}
