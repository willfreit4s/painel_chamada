import 'package:flutter/material.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';
import 'package:project_painel_de_chamada/app/repositories/painel_chamada_repository.dart';

class PainelChamadaController {
  List<PainelChamadaModel> painelChamada = [];
  final PainelChamadaRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  PainelChamadaController([PainelChamadaRepository? repository])
      : _repository = repository ?? PainelChamadaRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      painelChamada = await _repository.fetchPainelChamada();
      state.value = HomeState.success;
      return painelChamada;
    } catch (e) {
      state.value = HomeState.error;
      return state.value;
    }
  }
}

// Gerenciamento de estados
enum HomeState { start, loading, success, error }
