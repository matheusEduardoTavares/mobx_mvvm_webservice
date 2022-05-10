import 'dart:convert';

class CensusNamesModel {
  const CensusNamesModel({
    required this.name,
    required this.region,
    required this.frequency,
    required this.rank,
    required this.sex,
  });

  final String name;
  final int region;
  final int frequency;
  final int rank;
  final String sex;  

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'regiao': region,
      'freq': frequency,
      'rank': rank,
      'sexo': sex,
    };
  }

  factory CensusNamesModel.fromMap(Map<String, dynamic> map) {
    return CensusNamesModel(
      name: map['nome'] ?? '',
      region: int.tryParse(map['regiao']?.toString() ?? '') ?? 0,
      frequency: int.tryParse(map['freq']?.toString() ?? '') ?? 0,
      rank: int.tryParse(map['rank']?.toString() ?? '') ?? 0,
      sex: map['sexo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CensusNamesModel.fromJson(String source) => CensusNamesModel.fromMap(json.decode(source));
}
