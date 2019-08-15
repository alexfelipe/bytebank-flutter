class Transferencia {

  final int _numeroConta;
  final double _valor;

  Transferencia(this._numeroConta, this._valor);

  @override
  String toString() => "$_numeroConta - $_valor";

}