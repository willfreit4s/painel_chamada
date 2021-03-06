import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';
import 'package:project_painel_de_chamada/app/styles/style.dart';

// ignore: must_be_immutable
class UltimaChamadaWidget extends StatelessWidget {
  late PainelChamadaModel ultimaChamada;

  UltimaChamadaWidget(PainelChamadaModel data) {
    ultimaChamada = data;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 320,
        child: Card(
          elevation: 7,
          child: Column(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'Última Chamada',
                    style: myTextStyleBase.styleTitle,
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              ListTile(
                title: Center(
                  child: Text(
                    'Gate ${ultimaChamada.gate}',
                    style: myTextStyleBase.styleTitle,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListBody(
                            children: [
                              Row(
                                children: [
                                  Text('Motorista: ',
                                      style: myTextStyleBase.styleText),
                                  Text('${ultimaChamada.motorista}'),                                
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Placa: ',
                                      style: myTextStyleBase.styleText),
                                  Text('${ultimaChamada.placa}'),                                
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Agendamento: ',
                                      style: myTextStyleBase.styleText),
                                  Text('${ultimaChamada.agendamento}'),                                
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30, bottom: 20),
                        child: ClipOval(
                          child: Image.network(
                            'https://i.imgur.com/T07vR8G.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListBody(
                          children: [
                            Row(
                                children: [
                                  Text('Janela: ',
                                      style: myTextStyleBase.styleText),
                                  Text('${Jiffy(ultimaChamada.janelaDhi).format('HH:mm')} - ${Jiffy(ultimaChamada.janelaDhf).format('HH:mm')}'),                                
                                ],
                              ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text('Pesagem: ',
                                    style: myTextStyleBase.styleText),
                                Text('Não'),                                
                              ],
                            ),                         
                          ],
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      ListBody(
                        children: [
                          RichText(
                            text: TextSpan(                            
                              children: <TextSpan>[
                                TextSpan(text: 'Chegada: ', style: myTextStyleBase.styleText),                               
                                TextSpan(text: '${Jiffy(ultimaChamada.chegada).format('HH:mm')}'),                               
                              ]
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text('Status: ',
                                  style: myTextStyleBase.styleText),
                              Text('Primeira Chamada'),                                
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
