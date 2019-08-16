class Transferencia {
  final int numeroConta;
  final double valor;
  final int data;

  const Transferencia([this.numeroConta, this.valor]) : data = numeroConta;

  @override
  String toString() => "$numeroConta - $valor";
}
