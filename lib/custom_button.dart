import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
