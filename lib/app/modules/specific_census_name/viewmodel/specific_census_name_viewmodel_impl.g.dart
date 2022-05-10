// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specific_census_name_viewmodel_impl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpecificCensusNameViewmodelImpl
    on _SpecificCensusNameViewmodelImplBase, Store {
  Computed<String>? _$specificCensusSexComputed;

  @override
  String get specificCensusSex => (_$specificCensusSexComputed ??=
          Computed<String>(() => super.specificCensusSex,
              name: '_SpecificCensusNameViewmodelImplBase.specificCensusSex'))
      .value;

  late final _$specificCensusNameAtom = Atom(
      name: '_SpecificCensusNameViewmodelImplBase.specificCensusName',
      context: context);

  @override
  ObservableFuture<SpecificCensusNameModel?> get specificCensusName {
    _$specificCensusNameAtom.reportRead();
    return super.specificCensusName;
  }

  @override
  set specificCensusName(ObservableFuture<SpecificCensusNameModel?> value) {
    _$specificCensusNameAtom.reportWrite(value, super.specificCensusName, () {
      super.specificCensusName = value;
    });
  }

  late final _$getSpecificCensusNameAsyncAction = AsyncAction(
      '_SpecificCensusNameViewmodelImplBase.getSpecificCensusName',
      context: context);

  @override
  Future<void> getSpecificCensusName(String name) {
    return _$getSpecificCensusNameAsyncAction
        .run(() => super.getSpecificCensusName(name));
  }

  @override
  String toString() {
    return '''
specificCensusName: ${specificCensusName},
specificCensusSex: ${specificCensusSex}
    ''';
  }
}
