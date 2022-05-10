import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_recrutamento/app/core/rest_client/dio_rest_client.dart';
import 'package:flutter_test_recrutamento/app/core/rest_client/rest_client.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/general_person_listing_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RestClient>((i) => DioRestClient()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute, 
      module: CensusNamesModule(),
    )
  ];
}