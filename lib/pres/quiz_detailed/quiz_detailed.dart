import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/models/quiz/answer.dart';
import 'package:ecogrand_bank/data/models/quiz/question.dart';
import 'package:ecogrand_bank/data/models/quiz/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class QuizDetailed extends StatelessWidget {
  const QuizDetailed({super.key, required this.quiz});
  final Quiz quiz;

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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                quiz.title,
                style: const TextStyle(
                  color: CustomTheme.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Divider(
              thickness: 1,
              color: CustomTheme.dividerColor,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                '${quiz.questions.length} questions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomTheme.textGreyColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(
              quiz.questions.length,
              (index) {
                final question = quiz.questions[index];
                return QuestionWidget(question: question);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.question});
  final Question question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ColorTween _textColorTween;
  late ColorTween _dividerColorTween;
  var _opened = false;

  @override
  void didChangeDependencies() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _textColorTween = ColorTween(
      begin: CustomTheme.textGreyColor,
      end: Theme.of(context).primaryColor,
    );
    _dividerColorTween = ColorTween(
      begin: CustomTheme.dividerColor,
      end: Theme.of(context).primaryColor,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: _onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            widget.question.person.image,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.question.person.firstName,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.question.text,
                        style: const TextStyle(
                          fontSize: 16,
                          color: CustomTheme.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset('assets/dots.svg'),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const SizedBox(width: 56),
                    Expanded(
                      child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            final color = _textColorTween
                                    .evaluate(_animationController) ??
                                CustomTheme.textGreyColor;
                            return Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/msg.svg',
                                  colorFilter:
                                      ColorFilter.mode(color, BlendMode.srcIn),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${widget.question.answers.length} answers',
                                  style: TextStyle(
                                    color: _textColorTween
                                        .evaluate(_animationController),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Text(
                      DateFormat('dd MMMM, yyyy').format(widget.question.date),
                      style: const TextStyle(
                        color: CustomTheme.textGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Divider(
                      color: _dividerColorTween.evaluate(_animationController),
                      thickness: 1,
                    );
                  },
                ),
              ],
            ),
          ),
          AnswersWidget(
            answers: widget.question.answers,
            animationController: _animationController,
          ),
        ],
      ),
    );
  }

  void _onTap() {
    if (_animationController.isAnimating) {
      return;
    }
    setState(() {
      _opened = !_opened;
    });
    if (_opened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}

class AnswersWidget extends StatelessWidget {
  const AnswersWidget(
      {super.key, required this.answers, required this.animationController});
  final List<Answer> answers;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SizeTransition(
          sizeFactor: animationController,
          child: Opacity(
            opacity: animationController.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                answers.length,
                (index) {
                  final answer = answers[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 56),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(answer.person.image),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${answer.person.firstName} ${answer.person.lastName}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ' - ${DateFormat('dd MMMM, yyyy').format(answer.date)}',
                                style: const TextStyle(
                                  color: CustomTheme.textGreyColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          answer.text,
                          style: const TextStyle(
                            color: CustomTheme.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/smile.svg'),
                            SvgPicture.asset('assets/dots.svg'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (index != answers.length - 1)
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: CustomTheme.dividerColor,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
