import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'census_names_viewmodel_impl.g.dart';

class CensusNamesViewmodelImpl = _CensusNamesViewmodelImplBase with _$CensusNamesViewmodelImpl;

abstract class _CensusNamesViewmodelImplBase with Store implements CensusNamesViewmodel {
  _CensusNamesViewmodelImplBase({
    required CensusNamesRepository repository,
  }) : _repository = repository;

  final CensusNamesRepository _repository;

  @override
  @observable 
  var censusNames = ObservableFuture.value(<CensusNamesModel>[]);

  @override
  @action
  Future<void> getGeneralPeople() async {
    censusNames = ObservableFuture(_repository.getData());
  }
}