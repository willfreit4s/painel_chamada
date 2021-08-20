class PainelChamadaModel {
  int? gmoId;
  String? codTrizy;
  int? situacaoId;
  String? janelaDhi;
  String? janelaDhf;
  String? chegada;
  String? placa;
  String? agendamento;
  String? motorista;
  String? gate;
  String? foto;

  PainelChamadaModel(
    {
      this.gmoId,
      this.codTrizy,
      this.situacaoId,
      this.janelaDhi,
      this.janelaDhf,
      this.chegada,
      this.placa,
      this.agendamento,
      this.motorista,
      this.gate,
      this.foto
    }
  );


  PainelChamadaModel.fromJson(Map<String, dynamic> json) {
    gmoId = json['gmo_id'];
    codTrizy = json['cod_trizy'];
    situacaoId = json['situacao_id'];
    janelaDhi = json['janela_dhi'];
    janelaDhf = json['janela_dhf'];
    chegada = json['chegada'];
    placa = json['placa'];
    agendamento = json['agendamento'];
    motorista = json['motorista'];
    gate = json['gate'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gmo_id'] = this.gmoId;
    data['cod_trizy'] = this.codTrizy;
    data['situacao_id'] = this.situacaoId;
    data['janela_dhi'] = this.janelaDhi;
    data['janela_dhf'] = this.janelaDhf;
    data['chegada'] = this.chegada;
    data['placa'] = this.placa;
    data['agendamento'] = this.agendamento;
    data['motorista'] = this.motorista;
    data['gate'] = this.gate;
    data['foto'] = this.foto;
    return data;
  }
}