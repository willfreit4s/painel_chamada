// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';
import 'package:project_painel_de_chamada/app/styles/style.dart';

class UltimasChamadasWidget extends StatelessWidget {
  late List<PainelChamadaModel> painelChamadaData;

  UltimasChamadasWidget(List<PainelChamadaModel> data) {
    painelChamadaData = data;
  }

  @override
  Widget build(BuildContext context) {        
    return Expanded(
      flex: 2,
      child: Card(
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Center(
                child: Text('Últimas Chamadas', style: myTextStyleBase.styleTitle),
              ),
            ),
            Divider(color: Colors.grey),
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Motorista', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Placa', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Agendamento', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Gate', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Status', style: myTextStyleBase.styleText),
                ),
              ],
              rows: List.generate(painelChamadaData.length, (index) {
                return DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {                    
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                    }                    
                    if (index.isEven) {
                      return Colors.grey.withOpacity(0.2);
                    }
                    return null;
                  }),
                  cells: <DataCell>[
                    DataCell(
                      Text('${painelChamadaData[index].motorista!}'),
                    ),
                    DataCell(
                      Text('${painelChamadaData[index].placa!}'),
                    ),
                    DataCell(
                      Text('${painelChamadaData[index].agendamento!}'),
                    ),
                    DataCell(
                      Text('${painelChamadaData[index].gate!}'),
                    ),
                    DataCell(
                      Text('Primeira Chamada'),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
