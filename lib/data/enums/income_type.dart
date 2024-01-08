import 'package:json_annotation/json_annotation.dart';

enum IncomeType {
  @JsonValue('personal_income')
  personalIncome('assets/income_types/personal_income.svg', 'Personal income'),
  @JsonValue('real_estate')
  realEstate('assets/income_types/real_estate.svg', 'Real estate'),
  @JsonValue('dividents')
  dividents('assets/income_types/dividents.svg', 'Dividents');

  const IncomeType(this.iconPath, this.title);
  final String iconPath;
  final String title;
}
