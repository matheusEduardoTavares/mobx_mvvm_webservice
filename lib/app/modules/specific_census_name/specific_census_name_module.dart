import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository_impl.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/view/specific_census_name_view.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel_impl.dart';

class SpecificCensusNameModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<SpecificCensusNameRepository>((i) => SpecificCensusNameRepositoryImpl(
      restClient: i(),
    )),
    Bind.lazySingleton<SpecificCensusNameViewmodel>((i) => SpecificCensusNameViewmodelImpl(
      repository: i(),
    )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute, 
      child: (_, args) => SpecificCensusNameView(
        viewmodel: Modular.get(), 
        specificCensusName: args.data,
      ),
    )
  ];
}