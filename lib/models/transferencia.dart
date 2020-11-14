import 'package:flutter/material.dart';

class Transferencia extends ChangeNotifier {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  String valorFormatado() => 'R\$ $valor';

  String contaFormatada() => 'Conta: $numeroConta';

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
