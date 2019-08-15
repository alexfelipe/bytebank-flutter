import 'package:bytebank/ui/screens/screens.dart';
import 'package:flutter/material.dart';

import 'model/models.dart';

void main() => runApp(TelaInicial());

class TelaInicial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListaTransferencias(),
        '/form': (context) => FormularioTransferencia(
            callback: (Transferencia transferenciaCriada) =>
                print(transferenciaCriada))
      },
    );
  }

}
