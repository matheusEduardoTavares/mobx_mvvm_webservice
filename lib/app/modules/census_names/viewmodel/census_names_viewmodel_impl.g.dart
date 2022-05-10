// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'census_names_viewmodel_impl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CensusNamesViewmodelImpl on _CensusNamesViewmodelImplBase, Store {
  late final _$censusNamesAtom =
      Atom(name: '_CensusNamesViewmodelImplBase.censusNames', context: context);

  @override
  ObservableFuture<List<CensusNamesModel>> get censusNames {
    _$censusNamesAtom.reportRead();
    return super.censusNames;
  }

  @override
  set censusNames(ObservableFuture<List<CensusNamesModel>> value) {
    _$censusNamesAtom.reportWrite(value, super.censusNames, () {
      super.censusNames = value;
    });
  }

  late final _$getGeneralPeopleAsyncAction = AsyncAction(
      '_CensusNamesViewmodelImplBase.getGeneralPeople',
      context: context);

  @override
  Future<void> getGeneralPeople() {
    return _$getGeneralPeopleAsyncAction.run(() => super.getGeneralPeople());
  }

  @override
  String toString() {
    return '''
censusNames: ${censusNames}
    ''';
  }
}
