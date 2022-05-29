import 'package:primerio_projeto_dart/Vendedor.dart';
import 'package:primerio_projeto_dart/primerio_projeto_dart.dart' as primerio_projeto_dart;
import 'package:primerio_projeto_dart/gerador_cupom.dart' as cupom;

void main(List<String> arguments) {
  print('Hello world: ${primerio_projeto_dart.calculate()}!');

  Vendedor vendedor = new Vendedor();

  int untimo_cupom_id = 123453;
  int valor = 20;
  var validade = DateTime(2022, 11, 9);

  vendedor.setRazaoSocial("joao_ltda");

    var resultado = cupom.geradorCupom(vendedor, valor, untimo_cupom_id, validade);

  print("O resultado:" + resultado);
}

