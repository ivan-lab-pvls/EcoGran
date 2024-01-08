// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      type: $enumDecode(_$IncomeTypeEnumMap, json['type']),
      description: json['description'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'type': _$IncomeTypeEnumMap[instance.type]!,
      'description': instance.description,
      'amount': instance.amount,
    };

const _$IncomeTypeEnumMap = {
  IncomeType.personalIncome: 'personal_income',
  IncomeType.realEstate: 'real_estate',
  IncomeType.dividents: 'dividents',
};
