import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$ 100,00'),
                subtitle: Text('1000'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$ 210,00'),
                subtitle: Text('1001'),
              ),
            )
          ],
        ),
      ),
    ));
