import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';

abstract class SpecificCensusNameRepository {
  Future<SpecificCensusNameModel> getSpecificName(String name);
}