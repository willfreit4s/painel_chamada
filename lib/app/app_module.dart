import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_painel_de_chamada/app/pages/painel_chamada_page.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => PainelChamadaPage()),
      ];
}
