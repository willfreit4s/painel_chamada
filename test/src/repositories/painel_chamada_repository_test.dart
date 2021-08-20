import 'package:flutter_test/flutter_test.dart';
import 'package:project_painel_de_chamada/app/repositories/painel_chamada_repository.dart';

main() {
  final repository = PainelChamadaRepository();

  test('Trazer uma lista de Painel de Chamadas Model', () async {
    final list = await repository.fetchPainelChamada();
    print(list[0].motorista);
  });
}