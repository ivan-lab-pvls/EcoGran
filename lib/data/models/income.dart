import 'package:ecogrand_bank/data/enums/income_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Income {
  const Income({
    required this.type,
    required this.description,
    required this.amount,
  });
  final IncomeType type;
  final String description;
  final int amount;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}
