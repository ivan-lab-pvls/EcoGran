import 'package:ecogrand_bank/custom_theme.dart';
import 'package:flutter/material.dart';

class PersonsRow extends StatelessWidget {
  const PersonsRow({super.key, required this.pathes});
  final List<String> pathes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...List.generate(
          pathes.length,
          (index) => Padding(
            padding: EdgeInsets.only(left: index * 20),
            child: ClipOval(
              child: Image.asset(
                pathes[index],
                height: 32,
                width: 32,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: pathes.length * 20),
          alignment: Alignment.center,
          height: 32,
          width: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: CustomTheme.whiteColor,
          ),
          child: Text(
            pathes.length.toString(),
            style: const TextStyle(
              color: CustomTheme.lightGreyColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
