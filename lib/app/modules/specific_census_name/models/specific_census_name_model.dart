import 'dart:convert';

import 'package:flutter_test_recrutamento/app/modules/specific_census_name/models/census_period_model.dart';

class SpecificCensusNameModel {
  const SpecificCensusNameModel({
    required this.name,
    required this.sex,
    required this.location,
    required this.periods,
  });
  
  final String name;
  final String sex;
  final String location;
  final List<CensusPeriodModel> periods;

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'sexo': sex,
      'localidade': location,
      'res': periods.map((x) => x.toMap()).toList(),
    };
  }

  factory SpecificCensusNameModel.fromMap(Map<String, dynamic> map) {
    return SpecificCensusNameModel(
      name: map['nome'] ?? '',
      sex: map['sexo'] ?? '',
      location: map['localidade'] ?? '',
      periods: List<CensusPeriodModel>.from(map['res']?.map((x) => CensusPeriodModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecificCensusNameModel.fromJson(String source) => SpecificCensusNameModel.fromMap(json.decode(source));
}