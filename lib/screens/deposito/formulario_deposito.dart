
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatefulWidget {
  @override
  _FormularioDepositoState createState() => _FormularioDepositoState();
}

class _FormularioDepositoState extends State<FormularioDeposito> {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receber depósito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(BuildContext context) {
    //Provider.of(context)
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(!_validaDeposito(valor)) return;

    Provider.of<Saldo>(context, listen: false).adiciona(valor);

    Navigator.pop(context);
  }

  bool _validaDeposito(double valor) {
    return valor != null;
  }
}
