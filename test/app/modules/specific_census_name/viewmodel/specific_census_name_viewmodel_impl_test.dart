import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/viewmodel/specific_census_name_viewmodel_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/fixture/fixture_reader.dart';
import '../../../../core/repositories/mock_specific_census_name_repository.dart';

void main() {
  late SpecificCensusNameViewmodel viewmodel;
  late SpecificCensusNameRepository repository;

  setUp(() {
    repository = MockSpecificCensusNameRepository();
    viewmodel = SpecificCensusNameViewmodelImpl(
      repository: repository,
    );
  });

  test('Initialize with null model', () async {
    //Assert
    expect(viewmodel.specificCensusName.value, isNull);
  });

  test('getSpecificCensusName is correct', () async {
    const name = 'Maria';

    //Arrange
    when(() => repository.getSpecificName(name)).
      thenAnswer((invocation) async => Future.value(
        SpecificCensusNameModel.fromMap(FixtureReader.getData<Map<String, dynamic>>('/core/mocks/specific_census_name_mock.json'))
      ));

    //Act
    await viewmodel.getSpecificCensusName(name);

    final specificName = viewmodel.specificCensusName.value!;

    //Assert
    expect(specificName.name, name);
    expect(specificName.location, 'BR');
    expect(specificName.sex, 'F');
    expect(specificName.periods.length, 2);
  });
}