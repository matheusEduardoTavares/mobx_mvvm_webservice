import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:mobx/mobx.dart';

abstract class CensusNamesViewmodel {
  Future<void> getGeneralPeople();
  late ObservableFuture<List<CensusNamesModel>> censusNames;
}