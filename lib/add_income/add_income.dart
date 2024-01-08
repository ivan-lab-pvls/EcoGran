import 'package:ecogrand_bank/custom_button.dart';
import 'package:ecogrand_bank/custom_text_field.dart';
import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/enums/income_type.dart';
import 'package:ecogrand_bank/data/incomes_controller.dart';
import 'package:ecogrand_bank/data/models/income.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  late final IncomesController _incomesController;

  @override
  void didChangeDependencies() {
    _incomesController = context.read<IncomesController>();
    _incomesController.addListener(_update);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _incomesController.removeListener(_update);
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Navigator.of(context).pop(),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: CustomTheme.whiteColor,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Back',
                    style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 16),
                  )
                ],
              ),
            ),
            SvgPicture.asset('assets/dots.svg'),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Personal income',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomTheme.textGreyColor),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_incomesController.sum()} \$',
                  style: TextStyle(
                    fontSize: 32,
                    color: _incomesController.sum() == 0
                        ? CustomTheme.lightGreyColor
                        : CustomTheme.whiteColor,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: CustomTheme.darkGreyColor,
                      context: context,
                      builder: (context) {
                        return AddIncomeBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: CustomTheme.dividerColor),
                      color: CustomTheme.greyColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Add income',
                          style: TextStyle(
                            color: CustomTheme.textGreyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Income history',
                  style: TextStyle(color: CustomTheme.whiteColor, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_incomesController.incomes.length} transaction',
                  style: const TextStyle(
                      fontSize: 16, color: CustomTheme.lightGreyColor),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const Divider(
            color: CustomTheme.dividerColor,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 16),
          _incomesController.incomes.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'No information on income yet, click on the "Add income" button',
                    style: TextStyle(
                      color: CustomTheme.lightGreyColor,
                      fontSize: 16,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _incomesController.incomes.length,
                      (index) {
                        final income = _incomesController.incomes[index];

                        return Column(
                          children: [
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      income.description,
                                      style: const TextStyle(
                                        color: CustomTheme.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${income.amount} \$',
                                    style: const TextStyle(
                                      color: CustomTheme.textGreyColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(
                              thickness: 1,
                              height: 1,
                              color: CustomTheme.dividerColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class AddIncomeBottomSheet extends StatefulWidget {
  const AddIncomeBottomSheet({super.key});

  @override
  State<AddIncomeBottomSheet> createState() => _AddIncomeBottomSheetState();
}

class _AddIncomeBottomSheetState extends State<AddIncomeBottomSheet> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late final IncomesController _incomesController;
  IncomeType? _type;

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _incomesController = context.read<IncomesController>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Container(
              height: 5,
              width: 36,
              decoration: BoxDecoration(
                color: CustomTheme.lightGreyColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Add income',
                    style: TextStyle(
                      color: CustomTheme.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomTheme.lightGreyColor,
                    ),
                    child: const FittedBox(
                      child:
                          Icon(Icons.close, color: CustomTheme.textGreyColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: CustomTheme.dividerColor,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Income description',
                  style: TextStyle(
                    color: CustomTheme.textGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Example (Salary)',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Income amount',
                  style: TextStyle(
                    color: CustomTheme.textGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  hintText: 'Income amount',
                  onChanged: (text) {
                    if (!text.contains('\$')) {
                      _amountController.value = TextEditingValue(
                          text: '$text \$',
                          selection: TextSelection.fromPosition(
                              TextPosition(offset: text.length)));
                    } else {
                      final newText =
                          text.split('\$').first.trim().replaceAll(' ', '');
                      _amountController.value = TextEditingValue(
                          text: '$newText \$',
                          selection: TextSelection.fromPosition(
                              TextPosition(offset: text.length - 2)));
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Income type',
                  style: TextStyle(
                    color: CustomTheme.textGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonHideUnderline(
                  child: DropdownButton<IncomeType>(
                    style: const TextStyle(color: CustomTheme.whiteColor),
                    dropdownColor: CustomTheme.darkGreyColor,
                    isExpanded: true,
                    value: _type,
                    items: IncomeType.values
                        .map(
                          (e) => DropdownMenuItem<IncomeType>(
                            value: e,
                            child: Text(
                              e.title,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _type = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    final amount = int.tryParse(_amountController.text
                        .split('\$')
                        .first
                        .trim()
                        .replaceAll(' ', ''));
                    if (_type == null || amount == null) {
                      return;
                    }
                    final income = Income(
                      type: _type!,
                      description: _descriptionController.text,
                      amount: amount,
                    );
                    _incomesController.addIncome(income);
                    Navigator.of(context).pop();
                  },
                  text: 'Add income',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
