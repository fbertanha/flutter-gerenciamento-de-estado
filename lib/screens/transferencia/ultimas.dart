import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Últimas transferências',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final List<Transferencia> _ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final _tamanhoLista = transferencias.transferencias.length;

            if (_tamanhoLista == 0) {
              return SemTransferenciaCadastrada();
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: _tamanhoLista <= 3 ? _tamanhoLista : 3,
                itemBuilder: (context, index) {
                  return ItemTransferencia(_ultimasTransferencias[index]);
                });
          },
        ),
        RaisedButton(
          color: Colors.green,
          child: Text('Ver todas transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListaTransferencias()),
            );
          },
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Sem transferencias cadastradas',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
