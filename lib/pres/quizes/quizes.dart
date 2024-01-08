import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/models/quiz/quiz.dart';
import 'package:ecogrand_bank/pres/quiz_detailed/quiz_detailed.dart';
import 'package:ecogrand_bank/pres/quizes/widgets/persons_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Quizes extends StatelessWidget {
  const Quizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.of(context).pop(),
          child: const Row(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Quiz',
                style: TextStyle(
                  color: CustomTheme.whiteColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: CustomTheme.dividerColor,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '${quizes.length} themes',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: CustomTheme.textGreyColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              quizes.length,
              (index) {
                final quiz = quizes[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizDetailed(quiz: quiz),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          quiz.title,
                          style: const TextStyle(
                              color: CustomTheme.whiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: PersonsRow(
                                pathes: quiz.questions
                                    .map((e) => e.person.image)
                                    .toList(),
                              ),
                            ),
                            Text(
                              DateFormat('dd MMMM, yyyy').format(quiz.date),
                              style: const TextStyle(
                                color: CustomTheme.textGreyColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: CustomTheme.dividerColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
