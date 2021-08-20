import 'package:flutter/material.dart';
import 'package:project_painel_de_chamada/app/models/painel_chamada_model.dart';
import 'package:project_painel_de_chamada/app/styles/style.dart';

// ignore: must_be_immutable
class EmFilaWidget extends StatelessWidget {
  late List<PainelChamadaModel> painelChamada;


  EmFilaWidget(List<PainelChamadaModel> painelChamadaModel) {
    painelChamada = painelChamadaModel;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Center(
                child: Text('Em Fila',
                style: myTextStyleBase.styleTitle),
              ),
            ),
            Divider(color: Colors.grey),
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Janela', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Chegada', style: myTextStyleBase.styleText),
                ),
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
                  label: Text('Pesagem', style: myTextStyleBase.styleText),
                ),
                DataColumn(
                  label: Text('Status', style: myTextStyleBase.styleText),
                ),
              ],
              rows: List.generate(painelChamada.length, (index) {
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
                      Text('${painelChamada[index].janelaDhi}'),
                    ),
                    DataCell(
                      Text('${painelChamada[index].chegada}'),
                    ),
                    DataCell(
                      Text('${painelChamada[index].motorista}'),
                    ),
                    DataCell(
                      Text('${painelChamada[index].placa}'),
                    ),
                    DataCell(
                      Text('414702'),
                    ),
                    DataCell(
                      Text('Não'),
                    ),
                    DataCell(
                      Text('Na Fila'),
                    ),
                  ],
                );
              }),
            )      // DataTable(columns: columns, rows: rows)
          ],
        ),
      ),
    );
  }
}
