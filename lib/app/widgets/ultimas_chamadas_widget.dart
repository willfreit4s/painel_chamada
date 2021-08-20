// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';
import 'package:project_painel_de_chamada/app/styles/style.dart';

class UltimasChamadasWidget extends StatelessWidget {
  late List<PainelChamadaModel> brasileiros;

  UltimasChamadasWidget(List<PainelChamadaModel> brasilPainel) {
    brasileiros = brasilPainel;
    // print(brasileiros);
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
              rows: List.generate(brasileiros.length, (index) {
                return DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    // All rows will have the same selected color.
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    }
                    // Even rows will have a grey color.
                    if (index.isEven) {
                      return Colors.grey.withOpacity(0.2);
                    }
                    return null; // Use default value for other states and odd rows.
                  }),
                  cells: <DataCell>[
                    DataCell(
                      Text('${brasileiros[index].motorista!}'),
                    ),
                    DataCell(
                      Text('${brasileiros[index].placa!}'),
                    ),
                    DataCell(
                      Text('${brasileiros[index].agendamento!}'),
                    ),
                    DataCell(
                      Text('${brasileiros[index].gate!}'),
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
