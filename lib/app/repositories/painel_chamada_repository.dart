import 'package:dio/dio.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';

class PainelChamadaRepository {
  Dio dio;
  // final url = 'https://api.jsonbin.io/b/611bb24bd5667e403a449c87'; // +6 dados
  // final url = 'https://api.jsonbin.io/b/6123a1ba2aa80036126e688c'; // 4 dados
  final url = 'https://api.jsonbin.io/b/6123aa82076a223676aff095'; // 5 dados

  PainelChamadaRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<PainelChamadaModel>> fetchPainelChamada() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => PainelChamadaModel.fromJson(json)).toList();
  }
}

