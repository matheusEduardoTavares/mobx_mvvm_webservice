import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';

abstract class CensusNamesRepository {
  Future<List<CensusNamesModel>> getData();
}