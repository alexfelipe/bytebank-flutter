import 'package:bytebank/ui/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

const telaInicial = '/';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: telaInicial,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green[900],
      ),
      routes: {
        telaInicial: (context) => ListaTransferencias(),
      },
    );
  }
}
