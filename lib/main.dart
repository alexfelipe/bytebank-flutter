import 'package:bytebank/ui/screens/screens.dart';
import 'package:flutter/material.dart';

const telaInicial = '/';

void main() => runApp(
      MaterialApp(
        initialRoute: telaInicial,
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.green[900],
        ),
        routes: {
          telaInicial: (context) => ListaTransferencias(),
        },
      ),
    );
