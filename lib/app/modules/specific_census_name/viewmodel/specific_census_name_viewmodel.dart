import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:mobx/mobx.dart';

abstract class SpecificCensusNameViewmodel {
  Future<void> getSpecificCensusName(String name);
  late ObservableFuture<SpecificCensusNameModel?> specificCensusName;
  String get specificCensusSex;
}