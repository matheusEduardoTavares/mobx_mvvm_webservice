import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'specific_census_name_viewmodel_impl.g.dart';

class SpecificCensusNameViewmodelImpl = _SpecificCensusNameViewmodelImplBase with _$SpecificCensusNameViewmodelImpl;

abstract class _SpecificCensusNameViewmodelImplBase with Store implements SpecificCensusNameViewmodel {
  _SpecificCensusNameViewmodelImplBase({
    required SpecificCensusNameRepository repository,
  }) : _repository = repository;

  final SpecificCensusNameRepository _repository;

  @override
  @observable 
  var specificCensusName = ObservableFuture.value(null);

  @override
  @action
  Future<void> getSpecificCensusName(String name) async {
    specificCensusName = ObservableFuture(_repository.getSpecificName(name));
  }

  @override
  @computed
  String get specificCensusSex => (specificCensusName.value?.sex.isEmpty ?? true) 
    ? 'NÃO DEFINIDO' : specificCensusName.value!.sex;
}