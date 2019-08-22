import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _rotuloCampoNumeroConta = 'Número da conta';
const _tituloAppBar = 'Criando transferência';
const _dicaCampoNumeroConta = '0000';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FormularioTransferenciaState();
  }

}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              controlador: _controladorCampoNumeroConta,
            ),
            Editor(
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                icone: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () {
                  Transferencia transferenciaCriada = _criaTransferencia();
                  Navigator.pop(context, transferenciaCriada);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Transferencia _criaTransferencia() {
    final int conta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (conta == null || valor == null) {
      return null;
    }
    return Transferencia(valor, conta);
  }
}
