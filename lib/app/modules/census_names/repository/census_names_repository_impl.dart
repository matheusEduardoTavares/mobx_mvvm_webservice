import 'package:flutter_test_recrutamento/app/core/rest_client/rest_client.dart';
import 'package:flutter_test_recrutamento/app/core/utils/endpoints_utils.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository.dart';

class CensusNamesRepositoryImpl implements CensusNamesRepository {
  CensusNamesRepositoryImpl({
    required RestClient restClient
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<List<CensusNamesModel>> getData() async {
    final response = await _restClient.get(
      EndpointsUtils.getAll,
    );

    final responseData = List<Map<String, dynamic>>.from(response.data);
    return responseData.map(
      CensusNamesModel.fromMap
    ).toList();
  }
}