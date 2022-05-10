import 'package:flutter_test_recrutamento/app/core/rest_client/rest_client.dart';
import 'package:flutter_test_recrutamento/app/core/utils/endpoints_utils.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository.dart';

class SpecificCensusNameRepositoryImpl implements SpecificCensusNameRepository {
  SpecificCensusNameRepositoryImpl({
    required RestClient restClient
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<SpecificCensusNameModel> getSpecificName(String name) async {
    final response = await _restClient.get(
      '${EndpointsUtils.getAll}/$name',
    );
    
    final responseData = List<Map<String, dynamic>>.from(response.data);
    return SpecificCensusNameModel.fromMap(responseData[0]);
  }
}