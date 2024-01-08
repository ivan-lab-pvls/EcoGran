import 'package:ecogrand_bank/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.onChanged,
      this.hintText,
      this.keyboardType, this.focusNode, this.onSubmitted,});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: CustomTheme.whiteColor, fontSize: 16),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: CustomTheme.lightGreyColor, fontSize: 16),
        filled: true,
        fillColor: CustomTheme.greyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: CustomTheme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
