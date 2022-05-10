import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/specific_census_name_model.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/repository/specific_census_name_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/specific_census_name/view/specific_census_name_view.dart';
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

  testWidgets('Should render all information about specific census name correctly', (tester) async {
    const name = 'Maria';
    when(() => repository.getSpecificName(name)).
      thenAnswer((invocation) async => Future.value(
        SpecificCensusNameModel.fromMap(FixtureReader.getData<Map<String, dynamic>>('/core/mocks/specific_census_name_mock.json'))
      ));
      
    await tester.pumpWidget(
      MaterialApp(
        home: SpecificCensusNameView(
          viewmodel: viewmodel,
          specificCensusName: name,
        ),
      ),
    );

    await tester.pump();

    final nameInfoWidget = find.text(name);
    expect(nameInfoWidget, findsOneWidget);

    final sexInfoWidget = find.text('F');
    expect(sexInfoWidget, findsOneWidget);

    final locationInfoWidget = find.text('BR');
    expect(locationInfoWidget, findsOneWidget);

    final periodsListTile = find.byKey(const ValueKey('SpecificCensusNameListTile'));
    expect(periodsListTile, findsNWidgets(2));
  });
}