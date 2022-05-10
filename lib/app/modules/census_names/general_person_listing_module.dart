import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository_impl.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/view/census_names_view.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel_impl.dart';

class CensusNamesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<CensusNamesRepository>((i) => CensusNamesRepositoryImpl(
      restClient: i(),
    )),
    Bind.lazySingleton<CensusNamesViewmodel>((i) => CensusNamesViewmodelImpl(
      repository: i(),
    ))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute, 
      child: (_, __) => CensusNamesView(
        viewmodel: Modular.get(),
      )
    ),
  ];
}