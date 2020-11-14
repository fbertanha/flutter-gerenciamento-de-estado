import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/dashboard/saldo_card.dart';
import 'package:bytebank/screens/deposito/formulario_deposito.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('Receber depósito'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormularioDeposito()),
                  );
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text('Fazer transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormularioTransferencia()),
                  );
                },
              )
            ],
          ),
          UltimasTransferencias()
        ],
      ),
    );
  }
}
