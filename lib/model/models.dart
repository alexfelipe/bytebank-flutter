class Transferencia {
  final int numeroConta;
  final double valor;
  final DateTime data = DateTime.now();

  Transferencia(this.numeroConta, this.valor);

  @override
  String toString() => "$numeroConta - $valor";
}
