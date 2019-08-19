import 'package:flutter/material.dart';

void main() => runApp(Column(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Text(
          'Primeira transferência',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Segunda transferência',
          textDirection: TextDirection.ltr,
        ),
      ],
    ));
