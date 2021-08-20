import 'package:flutter/material.dart';
import 'package:project_painel_de_chamada/app/controllers/painel_chamada_controller.dart';
import 'package:project_painel_de_chamada/app/styles/style.dart';
import 'package:project_painel_de_chamada/app/widgets/em_fila.dart';
import 'package:project_painel_de_chamada/app/widgets/ultima_chamada_widget.dart';
import 'package:project_painel_de_chamada/app/widgets/ultimas_chamadas_widget.dart';

class PainelChamadaPage extends StatefulWidget {
  @override
  _PainelChamadaState createState() => _PainelChamadaState();
}

class _PainelChamadaState extends State<PainelChamadaPage> {
  final controllerPainelChamada = PainelChamadaController();

  _success() async {
    print(controllerPainelChamada.painelChamada);
    return controllerPainelChamada.start();
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controllerPainelChamada.start();
        },
        child: Text('Tentar Novamente!'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controllerPainelChamada.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Painel de Chamadas',
            style: myTextStyleBase.styleAppBar),
            backgroundColor: Color.fromRGBO(4, 32, 74, 1),
        ),
        body: AnimatedBuilder(
          animation: controllerPainelChamada.state,
          builder: (context, child) {
            if (controllerPainelChamada.state.value == HomeState.success) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        UltimaChamadaWidget(
                            controllerPainelChamada.painelChamada[0]),
                        SizedBox(width: 24),
                        UltimasChamadasWidget(
                            controllerPainelChamada.painelChamada),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        EmFilaWidget(controllerPainelChamada.painelChamada),
                      ],
                    )
                  ],
                ),
              );
            } else
              return stateManagement(controllerPainelChamada.state.value);
          },
        ));
  }
}
