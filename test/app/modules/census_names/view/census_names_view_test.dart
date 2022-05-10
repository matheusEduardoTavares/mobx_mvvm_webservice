import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/models/census_names_model.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/repository/census_names_repository.dart';
import 'package:flutter_test_recrutamento/app/modules/census_names/view/census_names_view.dart';
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

  testWidgets('Should render two ListTile', (tester) async {
    when(() => repository.getData()).
      thenAnswer((invocation) async => Future.value(
        FixtureReader.getData<List>('/core/mocks/census_name_mock.json')
          .map((e) => CensusNamesModel.fromMap(e)).toList()
      ));
      
    await tester.pumpWidget(
      MaterialApp(
        home: CensusNamesView(
          viewmodel: viewmodel,
        ),
      ),
    );

    await tester.pump();

    final widget = find.byKey(const ValueKey('CensusNameListTile'));
    expect(widget, findsNWidgets(2));
  });
}