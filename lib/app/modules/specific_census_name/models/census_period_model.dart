import 'dart:convert';

class CensusPeriodModel {
  const CensusPeriodModel({
    required this.period,
    required this.frequency,
  });

  final String period;
  final int frequency;  

  Map<String, dynamic> toMap() {
    return {
      'periodo': period,
      'frequencia': frequency,
    };
  }

  factory CensusPeriodModel.fromMap(Map<String, dynamic> map) {
    return CensusPeriodModel(
      period: map['periodo'] ?? '',
      frequency: int.tryParse(map['frequencia']?.toString() ?? '') ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CensusPeriodModel.fromJson(String source) => CensusPeriodModel.fromMap(json.decode(source));
}
