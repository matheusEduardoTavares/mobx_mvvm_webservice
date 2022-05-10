import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/viewmodel/census_names_viewmodel_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/fixture/fixture_reader.dart';
import '../../../../core/repositories/mock_census_name_repository.dart';

void main() {
  late CensusNamesViewmodel viewmodel;
  late CensusNamesRepository repository;

  setUp(() {
    repository = MockCensusNameRepository();
    viewmodel = CensusNamesViewmodelImpl(
      repository: repository,
    );
  });

  test('Initialize with empty list', () async {
    //Assert
    expect(viewmodel.censusNames.value, isEmpty);
  });

  test('getCensusNames is correct', () async {
    //Arrange
    when(() => repository.getData()).
      thenAnswer((invocation) async => Future.value(
        FixtureReader.getData<List>('/core/mocks/census_name_mock.json')
          .map((e) => CensusNamesModel.fromMap(e)).toList()
      ));

    //Act
    await viewmodel.getCensusNames();

    //Assert
    expect(viewmodel.censusNames.value, isNotEmpty);
    expect(viewmodel.censusNames.value!.length, 2);
    expect(viewmodel.censusNames.value![0].name, 'Maria');
    expect(viewmodel.censusNames.value![1].name, 'João');
  });
}